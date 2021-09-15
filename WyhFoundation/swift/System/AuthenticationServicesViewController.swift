//
//  AuthenticationServicesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//



import UIKit
enum AuthenticationServicesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS12+\n让用户轻松登录应用和服务。"
        case .topics:
            return "ASAuthorizationAppleIDProvider--基于用户的Apple ID生成用户身份验证请求的机制。\nASAuthorizationController--管理提供者创建的授权请求的控制器。\nASAuthorizationAppleIDCredential--成功的Apple ID认证所产生的证书。\napplinks--通用链接服务定义的根对象。\nUITextInputPasswordRules--表示文本输入字段密码规则的类。\nASAuthorizationPasswordProvider--生成请求以执行密钥链凭据共享的机制。\nASPasswordCredential--密码凭据。\nASAccountAuthenticationModificationController--执行修改帐户身份验证属性的请求的对象。\nASAccountAuthenticationModificationViewController--一个视图控制器，可以升级用户密码到强密码，或转换帐户使用Sign in with Apple。\nASAccountAuthenticationModificationExtensionContext--一个对象，您可以与之交互，以更改帐户密码或升级到与苹果登录。\nASWebAuthenticationSession--应用程序通过web服务验证用户身份的会话。\nASAuthorizationSingleSignOnProvider--生成请求以使用第三方提供者对用户进行身份验证的机制。\nASAuthorizationSingleSignOnCredential--成功的单点登录(SSO)身份验证产生的凭据。\nASAuthorizationProviderExtensionAuthorizationRequestHandler--一个接口，单点登录(SSO)身份验证提供者扩展通过它处理身份验证请求。\nASCredentialProviderViewController--一个视图控制器，密码管理器应用程序用来扩展密码自动填充。\nSignInWithAppleButton--创建用于显示的Sign in with Apple按钮的视图。"
        case .demo:
            return "Click here to example"
        }
    }
}

class AuthenticationServicesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [AuthenticationServicesViewControllerType.overview, AuthenticationServicesViewControllerType.topics, AuthenticationServicesViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AuthenticationServicesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AuthenticationServicesViewControllerType ?? AuthenticationServicesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AuthenticationServicesDemoViewController()
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








