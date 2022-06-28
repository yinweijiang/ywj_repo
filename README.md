# ywj_repo
javaweb扶贫网站的设计与实现（毕业设计作品）

1、介绍：基于javaweb的扶贫网站的设计，页面分为前台（用户页面），后台台（管理员页面）。

2、使用框架、技术：vue前端框架、springboot应用管理框架、mybatis-plus持久层框架、mysql关系型数据库、axios用于接口地址映射以及前后端数据交互。

3、前台页面功能：政策以及学生贷款信息的前台展示、用户上传商品和捐赠物、用户购买商品、贫困户使用贫困代币购买捐赠物实现受赠功能、普通用户提交申请提升权限至贫困户、贫困用户申请代币等。

4、后台页面功能：管理（增删改查）前台产生的用户、商品、捐赠物、商品订单、捐赠物订单、用户提起的贫困认证申请以及贫困代币申请等。

5、说明：该系统分为游客、用户、贫困户、管理员这4个角色，各角色权限不同，拥有的功能也不同，其中用户可通过提交贫困申请，经管理员同意后，提升权限成为贫困户以享受贫困户独有权限（购买捐赠物）。系统中引入贫困代币这一属性，为捐赠物设置贫困代币数量，这样可以防止一些贫困户无限制的乱拿捐赠物。

注意：本网站系统中大部分的图片存储使用了阿里云的对象存储OSS服务。若要实现图片正常的上传、显示，请自行开通该OSS服务，并修改代码中关于阿里云OSS账号设置的相关选项。如下面设置，这些属性需要从阿里云网站上获得，具体怎么做请参考阿里云官网或者百度，该服务新用户免费使用3个月，后续将收费，注意时间节点。各位也可将图片的上传显示功能改为本地服务，这样就可以避免收费。

#阿里云 OSS
#不同的服务器，地址不同
aliyun.oss.file.endpoint=oss-cn-beijing.aliyuncs.com
aliyun.oss.file.keyid=LTAI5t7KPS2SN4y3hU2jcwZo
aliyun.oss.file.keysecret=lLFSyfEPxkrywnat0r2EdyAZYmj7kk
#bucket可以在控制台创建，也可以使用java代码创建
aliyun.oss.file.bucketname=yinwj
aliyun.oss.file.filehost=https://

若代码拉下来后发现有缺，可通过以下链接获取完整项目，配置好环境后，可开箱即用。
完整项目网盘链接：https://pan.baidu.com/s/1WbxD88qvlsPtKpOfL7kT5w 
提取码：1874

