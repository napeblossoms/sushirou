class Dictionary < ApplicationRecord
    def self.search(method)
                if method == "全部"
                   @dictionarys = Dictionary.all
                elsif method == "春"
                   @dictionarys = Dictionary.where(season: "#{method}")
                elsif method == "夏"
                   @dictionarys = Dictionary.where(season: "#{method}")
                elsif method == "秋"
                   @dictionarys = Dictionary.where(season: "#{method}")
                elsif method == "冬"
                   @dictionarys = Dictionary.where(season: "#{method}")
                else
                  @dictionarys = Dictionary.all
                end
    end
end
