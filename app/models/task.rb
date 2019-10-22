class Task < ApplicationRecord
  belongs_to :post,optional: true

  enum language: { "html": 1,"css": 2, "javascript": 3, "ruby": 4, "php":5, "python":6, "java":7,"perl":8, "swift":9,"golang":10, "c":11,"c++":12,"c#":13,"その他":20}, _prefix: true
  enum time: { "1時間": 1, "2時間": 2, "3時間": 3,"4時間": 4, "5時間": 5, "6時間": 6,"7時間": 7, "8時間": 8, "9時間": 9,"10時間": 10, "11時間": 11, "12時間": 12}, _prefix: true
end
