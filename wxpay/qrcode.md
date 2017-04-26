# 需求分析
## 参考
- https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=6_4 (pay_flow)


## 扫码支付
### 支付流程 模式1
- 提交
UsrWx扫描M的二维码 -> Wxpay将预支付信息回调给M后台 -> M后台发起预支付 -> Wxpay返回支付授权给UsrWx -> Usr手机支付 -> Wxpay
- 同步响应
Wxpay -> Usr手机
- 异步响应
Wxpay -> M后台
### 使用条件
- 在公众平台后台设置支付回调URL
### 支付流程 模式2
- https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=6_5
- code_url有效期为2小时

