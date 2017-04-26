# 需求分析

## 参考
- https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=8_3 (pay_flow)


## APP支付

### 支付流程
- 提交
M_APP下单 -> M_server统一下单接口 -> Wxpay生产预支付 -> M_server -> M_APP -> Usr手机 -> Wxpay
- 同步响应
Wxpay -> Usr手机
- 异步响应
Wxpay -> M_server