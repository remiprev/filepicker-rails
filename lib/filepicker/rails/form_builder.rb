module Filepicker
  module Rails
    module FormBuilder

      def filepicker_field(method, options = {})
        input_options = {
          'data-fp-apikey' =>
          ::Rails.application.config.filepicker_rails.api_key,

          'data-fp-button-text' => options.fetch(:button_text, "Pick File"),

          'data-fp-button-class' => options[:button_class],

          'data-fp-mimetypes' => options[:mimetypes],

          'data-fp-option-container' => options[:container],

          'data-fp-option-multiple' => false,

          'data-fp-option-services' => Array(options[:services]).join(","),

          'data-fp-drag-text' => options.fetch(:drag_text, "Or drop files here"),

          'data-fp-drag-class' => options[:drag_class],

          'onchange' => options[:onchange],
          
          'class' => options[:class],
          
          'value' => options[:value]
        }

        input_options.merge! options[:html] if options[:html]

        type = options[:dragdrop] ? 'filepicker-dragdrop' : 'filepicker'

        ActionView::Helpers::InstanceTag.new(@object_name, method, @template)
          .to_input_field_tag(type, input_options)
      end
    end
  end
end
