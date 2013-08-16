Order.transaction do
  Order.all.each do |i|
    i.destroy
  end
end
