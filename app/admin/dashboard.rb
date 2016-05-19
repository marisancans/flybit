ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    

    columns do

      column do
        panel "Recently placed orders" do
          table_for Order.limit(15).select(:id, :email, :amount, :created_at).order('id desc') do
            column :id
            column "Email", :email do |order|
              link_to order.email, admin_order_path(order)
            end
            column :amount do |order|
              number_to_currency(order.amount,:unit=>'€ ')
            end
            column :created_at
          end
        end
      end

      column do
        panel "Recently recieved messages" do
          table_for SupportMessage.limit(15).select(:id, :email, :created_at).order('id desc') do
            column :id
            column "Email", :email do |message|
              link_to message.email, admin_support_message_path(message)
            end
            column :created_at
          end
        end
      end
    end

    columns do

      column do
        panel "Recently registred users" do
          table_for User.limit(15).select(:id, :email, :created_at).order('id desc') do
            column :id
            column "Email", :email do |user|
              link_to user.email, admin_user_path(user)
            end
            column :created_at
          end
        end
      end

      column do
        panel "Recently added products" do
          table_for Product.limit(15).select(:id, :title, :created_at).order('id desc') do
            column :id
            column "Title", :title do |product|
              link_to product.title, admin_product_path(product)
            end
            column :created_at
          end
        end
      end
    end
  end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
 # content
end
