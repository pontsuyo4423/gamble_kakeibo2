class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '中央競馬'},
    { id: 3, name: '地方競馬'},
    { id: 4, name: 'パチンコ'},
    { id: 5, name: 'スロット'},
    { id: 6, name: '競輪'},
    { id: 7, name: 'カジノ'},
    { id: 8, name: 'オートレース'},
    { id: 9, name: '競艇'},
    { id: 10, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :incomes
  has_many :payments
end