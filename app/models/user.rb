class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: "Cart"


  def create_cart
    cart = carts.create
    self.current_cart_id = cart.id
    save
  end

  def remove_cart
    self.current_cart_id = nil
    save
  end
end
