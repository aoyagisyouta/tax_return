class BuildingType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '木造（W造）' },
    { id: 3, name: '鉄骨造（S造）' },
    { id: 4, name: '鉄筋コンクリート造（RC造）' },
    { id: 5, name: '鉄筋鉄骨コンクリート造（SRC造）' },
    { id: 6, name: 'その他' }
]

  include ActiveHash::Associations
  has_many :properties

end