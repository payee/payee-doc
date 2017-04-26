# 需求分析
## 参考
- https://doc.open.alipay.com/docs/doc.htm?treeId=194&articleId=105072&docType=1 (pay_flow)
- https://doc.open.alipay.com/docs/api.htm?spm=a219a.7395905.0.0.C99ZIP&docType=4&apiId=757 (api)


## 条码支付
### 支付流程
- 提交
收银员生成Od + 条码识别设备扫描Usr条码 -> M收银台提交Od -> M后台提交Od -> Alipay
- 同步响应
Alipay -> M后台 -> M收银台
- 异步响应
Alipay -> Usr手机
### 使用条件
- 收银系统需要有红外扫描枪设备；
- 手机无网络要求，可离线支付；
- 支付宝会根据交易金额、登录状态等信息判断是否需要用户输入密码。


## 扫码支付
### 支付流程
- 提交
收银员生成Od -> M收银台发起预Od -> M后台请求预od -> Alipay
- 同步响应
Alipay od的二维码信息 -> M后台 -> M收银台 -> usr手机扫一扫
- 异步响应
用户付款后商家收银系统会拿到支付成功或者失败的结果
https://doc.open.alipay.com/docs/doc.htm?spm=a219a.7629140.0.0.tkf4YI&treeId=194&articleId=103296&docType=1
### 使用条件
- 无 用户仅出示手机扫码即可完成付款，方便快捷；

## 声波支付
### 支付流程
- 提交
收银员生成Od + 声波设备接收Usr信息 -> M收银台提交Od -> M后台提交Od -> Alipay
- 同步响应
Alipay -> M后台 -> M收银台
- 异步响应
Alipay -> Usr手机
### 使用条件
- 收银系统需要有声波接收终端
- 手机无网络要求，可离线支付
- 支付宝会根据交易金额、登录状态等信息判断是否需要用户输入密码

## 注意
- 建议交易轮询总时间设为30秒，轮询平均间隔设为3秒
- 同一笔交易若发起多次部分退款，每一次都需要改变out_request_no
- 超过24H的订单无法撤销，为每笔订单设置超时时间，超过时间未支付的订单会自动关闭
- 建议所有支付订单都加入storeid参数。storeid全部用字母和数字的组合。
- 建议商户订单号规则为“业务订单号+请求序号
- 使用交易支付接口alipay.trade.pay
    - 当同时传入store_id和alipay_store_id时，必须保证两者是匹配的，否则会报错。
    - timeout_express：默认为15天后超时。根据条码支付的实际场景，建议略大于商户系统设置的轮询时间，如2m。


## 问题
- 机具接入请传入terminalid 机具的含义
- 需要返回的ISV请确保传入正确的返佣参数，系统商接入如果不传入正确的sys_service_provider_id，会导致无法获得返佣。
- 结算和发票之间的关系
- 对于部分大型集团型或加盟型商户，如有“一个签约账号+多个收款中账号”的需求
- 金额的分类
    - 总额
    - 实付
    - 实收
    - 开票


