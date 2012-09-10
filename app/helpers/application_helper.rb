module ApplicationHelper
	def error_messages_for(object_name, options = {})
	  options = options.symbolize_keys
	  unless object_name.blank?
	    object = instance_variable_get("@#{object_name}")
	    unless object.blank?
	      if object.respond_to? :errors
	        unless object.errors.empty?
	          items = []
	          object.errors.each { |attribute, message| items << content_tag("dt", message) }
	          content_tag("dl",
	            items.uniq.join("").html_safe,
	            "id" => options[:id] || "error", "class" => options[:class] || "error"
	          )
	        end
	      end
	    end
	  end
	end
end
