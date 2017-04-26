# 需求分析

## 参考
- https://doc.open.alipay.com/docs/doc.htm?spm=a219a.7629140.0.0.GSqOoN&treeId=204&articleId=105297&docType=1 (flow)
- http://design.alipay.com/resource  (ui)

## APP支付

### 支付流程
- 提交
Usr的APP下单 -> M后台生成支付信息 -> M的APP唤起支付宝支付 -> Alipay
- 同步响应
Alipay -> Usr的APP
- 异步响应
Alipay -> M后台

### 使用条件
- 收银系统需要有红外扫描枪设备；
- 手机无网络要求，可离线支付；
- 支付宝会根据交易金额、登录状态等信息判断是否需要用户输入密码。

### [交易状态](https://doc.open.alipay.com/docs/doc.htm?spm=a219a.7629140.0.0.Co5V3r&treeId=204&articleId=106448&docType=1)
- WAIT_BUYER_PAY	交易创建，等待买家付款
- TRADE_CLOSED	未付款交易超时关闭，或支付完成后全额退款
- TRADE_SUCCESS	交易支付成功，可退款
- TRADE_FINISHED	交易结束，不可退款


