import UIKit
import AVFoundation

class ScanQRVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var dataQr: String = ""
    let avCaptureSession = AVCaptureSession()
    @IBOutlet weak var videoPreview: UIView!
    
    enum error: Error {
        case noCameraAvailable
        case videoInputFail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        
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
                performSegue(withIdentifier: "openLink", sender: self)
            }
        }
    }
    
    func ScanQr() throws {
        
        videoPreview = UIView(frame: CGRect(x: 300, y: 300, width: 400, height: 400))
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
