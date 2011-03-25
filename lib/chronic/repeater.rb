class Chronic::Repeater < Chronic::Tag #:nodoc:
  def self.t sym; Chronic.translate sym end

  def self.scan(tokens, options)
    # for each token
    tokens.each_index do |i|
      if t = self.scan_for_season_names(tokens[i]) then tokens[i].tag(t); next end
      if t = self.scan_for_month_names(tokens[i]) then tokens[i].tag(t); next end
      if t = self.scan_for_day_names(tokens[i]) then tokens[i].tag(t); next end
      if t = self.scan_for_day_portions(tokens[i]) then tokens[i].tag(t); next end
      if t = self.scan_for_times(tokens[i], options) then tokens[i].tag(t); next end
      if t = self.scan_for_units(tokens[i]) then tokens[i].tag(t); next end
    end
    tokens
  end

  def self.scan_for_season_names(token)
    scanner = {/^#{t :SPRING}$/ => :spring,
               /^#{t :SUMMER}$/ => :summer,
               /^#{t :AUTUMN}$/ => :autumn,
               /^#{t :WINTER}$/ => :winter}
    scanner.keys.each do |scanner_item|
      return Chronic::RepeaterSeasonName.new(scanner[scanner_item]) if scanner_item =~ token.word
    end

    return nil
  end

  def self.scan_for_month_names(token)
    scanner = {/^#{t :JAN}$/ => :january,
               /^#{t :FEB}$/ => :february,
               /^#{t :MAR}$/ => :march,
               /^#{t :APR}$/ => :april,
               /^#{t :MAY}$/ => :may,
               /^#{t :JUN}$/ => :june,
               /^#{t :JUL}$/ => :july,
               /^#{t :AUG}$/ => :august,
               /^#{t :SEP}$/ => :september,
               /^#{t :OCT}$/ => :october,
               /^#{t :NOV}$/ => :november,
               /^#{t :DEC}$/ => :december}
    scanner.keys.each do |scanner_item|
      return Chronic::RepeaterMonthName.new(scanner[scanner_item]) if scanner_item =~ token.word
    end
    return nil
  end

  def self.scan_for_day_names(token)
    scanner = {/^#{t :MON}$/ => :monday,
               /^#{t :TUE}$/ => :tuesday,
               /^#{t :WED}$/ => :wednesday,
               /^#{t :THU}$/ => :thursday,
               /^#{t :FRI}$/ => :friday,
               /^#{t :SAT}$/ => :saturday,
               /^#{t :SUN}$/ => :sunday}
    scanner.keys.each do |scanner_item|
      return Chronic::RepeaterDayName.new(scanner[scanner_item]) if scanner_item =~ token.word
    end
    return nil
  end

  def self.scan_for_day_portions(token)
    scanner = {/^#{t :AM}$/ => :am,
               /^#{t :PM}$/ => :pm,
               /^#{t :MORNING}$/ => :morning,
               /^#{t :AFTERNOON}$/ => :afternoon,
               /^#{t :EVENING}$/ => :evening,
               /^#{t :NIGHT}$/ => :night}
    scanner.keys.each do |scanner_item|
      return Chronic::RepeaterDayPortion.new(scanner[scanner_item]) if scanner_item =~ token.word
    end
    return nil
  end

  def self.scan_for_times(token, options)
    if token.word =~ /^\d{1,2}(:?\d{2})?([\.:]?\d{2})?$/
      return Chronic::RepeaterTime.new(token.word, options)
    end
    return nil
  end

  def self.scan_for_units(token)
    scanner = {/^#{t :YEAR}$/ => :year,
               /^#{t :SEASON}$/ => :season,
               /^#{t :MONTH}$/ => :month,
               /^#{t :FORTNIGHT}$/ => :fortnight,
               /^#{t :WEEK}$/ => :week,
               /^#{t :WEEKEND}$/ => :weekend,
               /^#{t :WEEKDAY}$/ => :weekday,
               /^#{t :DAY}$/ => :day,
               /^#{t :HOUR}$/ => :hour,
               /^#{t :MINUTE}$/ => :minute,
               /^#{t :SECOND}$/ => :second}
    scanner.keys.each do |scanner_item|
      if scanner_item =~ token.word
        klass_name = 'Chronic::Repeater' + scanner[scanner_item].to_s.capitalize
        klass = eval(klass_name)
        return klass.new(scanner[scanner_item])
      end
    end
    return nil
  end

  def <=>(other)
    width <=> other.width
  end

  # returns the width (in seconds or months) of this repeatable.
  def width
    raise("Repeatable#width must be overridden in subclasses")
  end

  # returns the next occurance of this repeatable.
  def next(pointer)
    !@now.nil? || raise("Start point must be set before calling #next")
    [:future, :none, :past].include?(pointer) || raise("First argument 'pointer' must be one of :past or :future")
    #raise("Repeatable#next must be overridden in subclasses")
  end

  def this(pointer)
    !@now.nil? || raise("Start point must be set before calling #this")
    [:future, :past, :none].include?(pointer) || raise("First argument 'pointer' must be one of :past, :future, :none")
  end

  def to_s
    'repeater'
  end
end
