ActiveRecord::Base.class_eval do

  class << self

    def validates_attribute_greater( *args )
      options = args.extract_options!.dup
      greater_than_attribute = options[:than]
      validates_each *args do |model, attribute, value|
        other_value = model.send( greater_than_attribute )
        if (!value.blank? &&
              !other_value.blank? &&
              ( value < other_value ))
          model.errors.add(
            attribute,
            I18n.t( 'activerecord.errors.messages.attribute_greater_than',
              :attribute => model.class.human_attribute_name( greater_than_attribute.to_s ) ) )
        end
        true
      end
    end

  end

end