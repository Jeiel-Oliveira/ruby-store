module ApplicationHelper
  def styled_link_to(text, path, variant, **options)
    base_classes = "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 font-medium inline-block"

    variant_classes = case variant
    when :primary
      "bg-blue-100 border border-blue-200 hover:bg-blue-200 text-blue-700"
    when :blue
      "bg-blue-100 border border-blue-200 hover:bg-blue-200 text-blue-700"
    when :red
      "bg-red-100 border border-red-200 hover:bg-red-200 text-red-700"
    when :green
      "bg-green-100 border border-green-200 hover:bg-green-200 text-green-700"
    when :gray
      "bg-gray-100 border border-gray-200 hover:bg-gray-200 text-gray-700"
    else
      "bg-gray-100 border border-gray-200 hover:bg-gray-200 text-gray-700"
    end

    link_to(text, path, class: "#{base_classes} #{variant_classes} #{options[:class]}", **options)
  end
end
