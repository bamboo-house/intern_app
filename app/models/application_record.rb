class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.data_save(titles, names, links)
    titles.zip(names, links) do |title, name, link|
      unless self.find_by(event_title: title.text) #レコードの重複を阻止
        self.create(
          group_name: name.text,
          event_title: title.text,
          link_url: link.attribute('href'),
        )
      end
    end
  end

end
