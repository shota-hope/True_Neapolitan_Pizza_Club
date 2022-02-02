# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.napolipizza-club.com"

SitemapGenerator::Sitemap.create do

    add shops_path, :priority => 0.7, :changefreq => 'daily'

    Shop.find_each do |shop|
      add shop_path(shop), :changefreq => 'weekly'
    end
end
