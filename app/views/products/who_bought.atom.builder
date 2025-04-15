atom_feed do |feed|
  feed.title "Who bought #{@product.name}"
  feed.updated @latest_order.try(:updated_at) || Time.zone.now

  @product.orders.each do |order|
    feed.entry order do |entry|
      entry.title "Order ##{order.id}"
      entry.summary type: "xhtml" do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        xhtml.p "Email: #{order.email}"
        xhtml.p "Pay type: #{order.pay_type}"

        xhtml.table do
          xhtml.tr do
            xhtml.th "Product"
            xhtml.th "Quantity"
            xhtml.th "Total Price"
          end
        end

        order.line_items.each do |item|
          xhtml.tr do
            xhtml.td item.product.name
            xhtml.td item.quantity
            xhtml.td item.total_price
          end
        end

        xhtml.tr do
          xhtml.th "Total", colspan: 2
          xhtml.th @product.price * order.line_items.sum(:quantity)
        end
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
      entry.updated order.updated_at
    end
  end
end
