require 'menu'

describe Menu do
  let(:dish) { double :dish }
  let(:dish_class) { double :dish_class, new: dish }
  let(:menu) { Menu.new(dish_class) }

  context '#Viewing the menu' do
    it "should add an item to the menu_items list" do
      menu.add(dish)
      dish_display = "36. Chicken Korma £7.95"
      expect(dish).to receive(:display).and_return(dish_display)
      expect(menu.view).to eq "#{dish_display}\n"
    end

    it "returns 1 menu item in a nice string" do
      menu.add(Dish.new(36, "Chicken Korma", 7.95))
      expect(menu.view).to eq "36. Chicken Korma £7.95\n"
    end
  end
end
