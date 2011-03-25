module Chronic
  class << self
    def translate symbol
      Translation::Current.const_get symbol
    end
    alias :t :translate

	 def language= lang
		Translation::Current.translation = lang
	 end
  end

  module Translation
    autoload :EN, 'chronic/translations/en'
    autoload :DE, 'chronic/translations/de'

    module Current
      # Set the default. Quite... hackish?
      instance_variable_set :@translation, Chronic::Translation::EN

      # Set the active translation.
      # @param [Symbol] language The language to use
      def self.translation= language
        @translation = Translation.const_get language
      end

      def self.const_missing const
        @translation.const_get const
      end
    end
  end
end
