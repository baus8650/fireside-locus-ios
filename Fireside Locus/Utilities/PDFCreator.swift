//
//  PDFCreator.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/17/22.
//

import UIKit

class PDFCreator: NSObject {

    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func makePDF() -> Data {
        let pdfMetaData = [
            kCGPDFContextCreator: "Supervision Shifts",
            kCGPDFContextAuthor: "Luzerne Music Center"
        ]
        
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageWidth = 11 * 72.0
        let pageHeight = 8.5 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            
            let imageBottom = addImage(pageRect: pageRect, imageTop: 0 + 18.0, image: image)
            
            //            let attributes = [
            //                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
            //            ]
            //            let text = "I'm a PDF!"
            //            text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
            
        }
        
        return data
    }
    
    func addImage(pageRect: CGRect, imageTop: CGFloat, image: UIImage) -> CGFloat {
        // 1
        let maxHeight = pageRect.height * 0.9
        let maxWidth = pageRect.width * 0.9
        // 2
        let aspectWidth = maxWidth / image.size.width
        let aspectHeight = maxHeight / image.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        // 3
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        // 4
        let imageX = (pageRect.width - scaledWidth) / 2.0
        let imageRect = CGRect(x: imageX, y: imageTop,
                               width: scaledWidth, height: scaledHeight)
        // 5
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
    
}
