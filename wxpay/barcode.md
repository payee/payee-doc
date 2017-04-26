# 需求分析
## 参考
- https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=5_4 (pay_flow)


## 条码支付
### 支付流程 免密流程
- 提交
收银员生成Od + 条码识别设备扫描Usr条码 -> M收银台提交Od -> M后台提交Od -> Wxpay
- 同步响应
Wxpay -> M后台 -> M收银台
- 异步响应
Wxpay -> Usr手机
### 支付流程 需要密码
- 提交
收银员生成Od + 条码识别设备扫描Usr条码 -> M收银台提交Od -> M后台提交Od -> Wxpay -> UsrWx支付 -> Wxpay
- 同步响应
Wxpay -> Usr手机
- 异步响应
Wxpay -> M后台
### [支付免密规则](https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=5_2)
- 支付金额>500元的交易需要验证用户支付密码
- 用户账号每天最多有5笔交易可以免密，超过后需要验证密码
- 微信支付后台判断用户支付行为有异常情况，符合免密规则的交易也会要求验证密码
### shorturl
- https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_9&index=8

