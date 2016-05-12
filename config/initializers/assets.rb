# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

%w( controller_one controller_two controller_three ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
end

Rails.application.config.assets.precompile += %w( active_admin.scss departments.css.scss
																									categories.css.scss products.css.scss
																									static_pages.css.scss navbar.scss
																									scaffolds.css carts.scss
																									charges.css home_page.css.scss
																									devise/registrations.css.scss searches.css
																									navbar-fixed-side.css.scss product_show_page.css.scss
																									jquery.chocolat.js chocolat.css.scss
																									carts.css.scss charges.css.scss
																									thank_you.css.scss checkout.css devise/sessions.css.scss
																									devise/passwords.css.scss footer.css.scss)

