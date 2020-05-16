import UIKit
import AVFoundation

class ScanQRVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var dataQr: String = ""
    let avCaptureSession = AVCaptureSession()
    var mainBackground: UIImageView!
    var videoPreview: UIView!
    var goBack: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 280, width: 77, height: 78))
        button.setImage(UIImage(named: "GoBackButton"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(GoHome(_:)), for: .touchUpInside)
        return button
    }()
    
    enum error: Error {
        case noCameraAvailable
        case videoInputFail
    }
    
    @objc func GoHome(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setUpView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true

        mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        guard let image  = UIImage(named: "Home_Background") else { return }
        mainBackground.image = image
        mainBackground.contentMode = .scaleToFill

        view.addSubview(mainBackground)

        videoPreview = UIView(frame: CGRect(x: 100, y: 100, width: 400, height: 270))
        videoPreview.backgroundColor = .black
        view.addSubview(videoPreview)
        view.addSubview(goBack)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        do {
            try ScanQr()
        } catch {
            print("Failed to scan QR")
        }
    }
     
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 && metadataObjects != nil {
            let mechineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if mechineReadableCode.type == AVMetadataObject.ObjectType.qr {
                avCaptureSession.stopRunning()
                dataQr = mechineReadableCode.stringValue!
                let viewControllers = ContentDetails()
                viewControllers.flagging = false
                viewControllers.qrData = dataQr
                
                let getContent: Content
                let getColor: UIColor
                
                (getContent, getColor) = GetContentById(idData: dataQr)
                
                viewControllers.colorMasking = getColor
                viewControllers.dataContent = getContent
                
                navigationController?.pushViewController(viewControllers, animated: true)
            }
        }
    }

    func ScanQr() throws {

        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                print("No camera")
                throw error.noCameraAvailable
        }

        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else {
            print("Failed to init camera")
            throw error.videoInputFail
        }

        let avCaptureMetadataOutput = AVCaptureMetadataOutput()

        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]

        let avCaptureVideoPreview = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreview.videoGravity = .resizeAspectFill
        avCaptureVideoPreview.frame = videoPreview.bounds

        self.videoPreview.layer.addSublayer(avCaptureVideoPreview)

        avCaptureSession.startRunning()
    }
}
