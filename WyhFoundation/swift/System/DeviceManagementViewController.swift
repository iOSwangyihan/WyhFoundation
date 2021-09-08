//
//  DeviceManagementViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/8.
//



import UIKit
enum DeviceManagementViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n远程管理组织的设备。"
        case .topics:
            return "TopLevel:\nTopLevele--用于配置所有概要文件的顶级负载属性。\nCommonPayloadKeys--在所有概要文件中都通用的负载属性。。\nCalDAV--用于配置Calendar帐户的有效负载。\nCardDAV--配置联系人帐户的有效负载。\nGoogleAccount--配置谷歌帐户的有效载荷。\nLDAP--配置LDAP帐户的有效载荷。\nSubscribedCalendars--配置订阅日历的有效负载。\nAirPlay--配置AirPlay设置的有效载荷。\nAppLock--配置设备以运行单个应用程序的有效载荷。\nTVRemote--配置苹果电视遥控器的有效载荷。\nExtensibleSingleSignOn--用于配置执行单点登录的应用扩展的有效载荷。\nExtensibleSingleSignOnKerberos--配置使用Kerberos扩展执行单点登录的应用程序扩展的有效负载。\nSingleSignOn--配置单点登录的有效负载。\nCertificatePEM--配置pem格式证书的有效载荷。\nCertificatePKCS1--配置pkcs# 1格式的证书的有效负载。\nCertificatePKCS12--配置pkcs# 12格式的证书的有效负载。\nCertificateRoot--配置根证书的有效负载。\nCertificateRevocation--配置证书撤销检查的有效载荷。\nCertificateTransparency--用于配置证书透明性实施的有效负载。\nSCEP--配置简单证书登记协议(SCEP)的有效载荷。\nExchangeActiveSync--配置Exchange ActiveSync帐户的有效载荷。\nMail--设备上配置邮件帐户的有效载荷。\nEducationConfiguration--教育组织中用于配置用户、组和部门的有效负载。\nMDM--MDM (mobile device management)配置的有效载荷。\nProfileRemovalPassword--配置概要文件删除的有效负载。\nCellular--配置蜂窝设置的有效载荷。\nDomains--在组织管理下配置域的有效负载。\nDNSSettings--配置加密DNS设置的有效载荷。\nNetworkUsageRules--配置网络使用规则的有效负载。\nWiFi--设备上配置Wi-Fi的有效载荷。\nAirPrint--在用户的打印机列表中配置AirPrint打印机的有效载荷。\nDNSProxy--配置DNS代理的有效负载。\nGlobalHTTPProxy--配置全局HTTP代理的有效负载。\nRestrictions--在设备上配置限制的有效载荷。\nPasscode--配置密码策略的有效载荷。\nFont--配置字体的有效负载。\nLockScreenMessage--用于配置锁定屏幕消息的有效载荷。\nHomeScreenLayout--配置主界面布局的有效载荷。\nNotifications--配置通知的有效负载。\nSetupAssistant--配置安装辅助设置的有效负载。\nAppLayerVPN--配置附加VPN软件的有效载荷。\nVPN--配置VPN的有效载荷。\nWebClip--在设备上配置web剪辑的配置文件。\nWebContentFilter--配置web内容过滤器的有效负载。\n"
        case .demo:
            return "Click here to example"
        }
    }
}

class DeviceManagementViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [DeviceManagementViewControllerType.overview, DeviceManagementViewControllerType.topics, DeviceManagementViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DeviceManagementViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DeviceManagementViewControllerType ?? DeviceManagementViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DeviceManagementDemoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
               
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}







