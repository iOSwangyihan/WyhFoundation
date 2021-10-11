//
//  MapKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/9.
//




import UIKit
enum MapKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n在应用程序中显示地图或卫星图像，指出感兴趣的点，并确定地图坐标的placemark信息。"
        case .topics:
            return "MKMapView--一个可嵌入的地图接口，类似于Maps应用程序提供的接口。\nMKMapItem--地图上的一个兴趣点。\nMap--显示嵌入式映射接口的视图。\nMKCoordinateRegion--以某一特定纬度和经度为中心的矩形地理区域。\nMKCoordinateSpan--地图区域的宽度和高度。\nMKMapRect--二维地图投影上的矩形区域。\nMKMapPoint--二维地图投影上的一个点。\nMKMapSize--二维地图投影上的宽度和高度信息。\nMKDistanceFormatter--在地理距离和该距离的基于字符串的表达式之间进行转换的工具对象。\nMKMapCamera--用于定义地图外观的虚拟摄像机。\nMKCompassButton--一个专门的视图，用于显示与其关联的地图的当前罗盘航向。\nMKScaleView--显示其关联地图的当前比例尺信息的专用视图。\nMKUserTrackingButton--如果地图跟踪到用户所面对的标题，则允许用户切换的专用按钮。\nMKUserTrackingBarButtonItem--一个特殊的栏按钮项，如果地图跟踪到用户所面对的标题，则允许用户进行切换。\nMapKit Annotations--创建注释，为地图上的特定位置添加指示器和额外细节。\nMapKit Overlays--创建覆盖以突出地理区域或路径。\nMKGeoJSONDecoder--一个将GeoJSON对象解码为MapKit类型的对象。\nMKGeoJSONFeature--GeoJSON特性的解码表示。\nMKGeoJSONObject--可以由GeoJSON解码器返回的对象。\nMKDirections--一个实用程序对象，它根据您提供的路线信息计算方向和旅行时间信息。\nMKDirections.Request--路线的起点和终点，以及计划的运输方式。\nMKDirections.Response--苹果服务器在回应你的一个方向请求时返回的路由信息。\nMKDirections.ETAResponse--苹果服务器返回的旅行时间信息。\nMKRoute--在请求的起点和终点之间的单一路由。\nMKRoute.Step--整个路线的一部分\nMKLocalSearch--用于初始化基于地图的搜索和处理结果的实用程序对象。\nMKLocalPointsOfInterestRequest--搜索兴趣点时使用的结构化请求。\nMKLocalSearch.ResultType--指示搜索结果类型的选项。\nMKLocalSearchCompleter--一个实用工具对象，用于根据您提供的部分搜索字符串生成完成字符串列表。\nMKLocalSearchCompleter.ResultType--指示搜索完成类型的选项。\nMKLocalSearchCompletion--完整的字符串，完成部分字符串。\nMKPointOfInterestFilter--从地图视图、本地搜索或本地搜索完成器中包括或排除感兴趣的点类别的筛选器。\nMKPointOfInterestCategory--兴趣点类别。\nMKMapSnapshotter--用于捕获地图及其内容到图像中的实用程序类。\nMKMapSnapshotter.Snapshot--由快照对象生成的图像。\nMKError--MapKit框架的错误常量。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MapKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MapKitViewControllerType.overview, MapKitViewControllerType.topics, MapKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MapKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MapKitViewControllerType ?? MapKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MapKitDemoViewController()
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

