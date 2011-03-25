module Chronic::Translation
  module EN
    # Chronic#pre_normalize
    TODAY = "today"
    TOMORROW = "tomm?orr?ow"
    YESTERDAY = "yesterday"
    NOON = "noon"
    MIDNIGHT = "midnight"
    BEFORE_NOW = "before now"
    NOW = "now"
    AGO_BEFORE = "(ago|before)"
    THIS_PAST = "this past"
    THIS_LAST = "this last"
    MORNINGS = "(?:in|during) the (morning)"
    DAYTIMES = "(?:in the|during the|at) (afternoon|evening|night)"
    TONIGHT = "TONIGHT"
    FUTURES = "(hence|after|from)"

    # Chronic::Grabber#scan_for_all
    THIS = "this"
    NEXT = "next"

    # Chronic::Ordinal
    ORDINAL = "(\d*)(st|nd|rd|th)"

    # Chronic::Pointer
    PAST = "past"
    FUTURE = "future"
    FUTURE_IN = "in"

    # Chronic::Repeater#scan_for_season_names
    SPRING = "springs?"
    SUMMER = "summers?"
    AUTUMN = "(autumn)|(fall)s?"
    WINTER = "winters?"

    # Chronic::Repeater#scan_for_month_names
    JAN = "jan\.?(uary)?"
    FEB = "feb\.?(ruary)?"
    MAR = "mar\.?(ch)?"
    APR = "apr\.?(il)?"
    MAY = "may"
    JUN = "jun\.?e?"
    JUL = "jul\.?y?"
    AUG = "aug\.?(ust)?"
    SEP = "sep\.?(t\.?|tember)?"
    OCT = "oct\.?(ober)?"
    NOV = "nov\.?(ember)?"
    DEC = "dec\.?(ember)?"

    # Chronic::Repeater#scan_for_day_names
    MON = "m[ou]n(day)?"
    TUE = "t(ue|eu|oo|u|)s(day)?|^tue"
    WED = "we(dnes|nds|nns)day|^wed"
    THU = "th(urs|ers)day|^thu"
    FRI = "fr[iy](day)?"
    SAT = "sat(t?[ue]rday)?"
    SUN = "su[nm](day)?"

    # Chronic::Repeater#scan_for_day_portions
    AM = "ams?"
    PM = "pms?"
    MORNING = "mornings?"
    AFTERNOON = "afternoons?"
    EVENING = "evenings?"
    NIGHT = "(night|nite)s?"

    # Chronic::Repeater#scan_for_units
    YEAR = "years?"
    SEASON = "seasons?"
    MONTH = "months?"
    FORTNIGHT = "fortnights?"
    WEEK = "weeks?"
    WEEKEND = "weekends?"
    WEEKDAY = "(week|business)days?"
    DAY = "days?"
    HOUR = "hours?"
    MINUTE = "minutes?"
    SECOND = "seconds?"

    # Chronic::Scalar
    DAYTIME_WORDS = %w{am pm morning afternoon evening night}
   
    # Numerizer
    DIRECT_NUMS = [
                    ['eleven', '11'],
                    ['twelve', '12'],
                    ['thirteen', '13'],
                    ['fourteen', '14'],
                    ['fifteen', '15'],
                    ['sixteen', '16'],
                    ['seventeen', '17'],
                    ['eighteen', '18'],
                    ['nineteen', '19'],
                    ['ninteen', '19'], # Common mis-spelling
                    ['zero', '0'],
                    ['one', '1'],
                    ['two', '2'],
                    ['three', '3'],
                    ['four(\W|$)', '4\1'],  # The weird regex is so that it matches four but not fourty
                    ['five', '5'],
                    ['six(\W|$)', '6\1'],
                    ['seven(\W|$)', '7\1'],
                    ['eight(\W|$)', '8\1'],
                    ['nine(\W|$)', '9\1'],
                    ['ten', '10'],
                    ['\ba[\b^$]', '1'] # doesn't make sense for an 'a' at the end to be a 1
                ]

  TEN_PREFIXES = [ ['twenty', 20],
                    ['thirty', 30],
                    ['fourty', 40],
                    ['fifty', 50],
                    ['sixty', 60],
                    ['seventy', 70],
                    ['eighty', 80],
                    ['ninety', 90]
                  ]

  BIG_PREFIXES = [ ['hundred', 100],
                    ['thousand', 1000],
                    ['million', 1_000_000],
                    ['billion', 1_000_000_000],
                    ['trillion', 1_000_000_000_000],
                  ]

  # Numerizer#numerize
  HALF = "a half"

  # Numerizer#andition
  AND = "and"
  end
end
