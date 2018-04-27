# Polling
實作一個投票系統來練習Rails的基本觀念，使用：
- Devise做用戶系統
- Rspec做測試
- Factory Girl做測資
註冊系統只能生出一般user，要生出有admin權限的需要直接進rails console去新增user(將admin設為true)

## Admin
- 可以新增/刪除許多不同投票主題
- 可以新增/刪除對應的投票問題

## Users
- 可以參加所有主題的投票
- 一次只能回答一個答案
