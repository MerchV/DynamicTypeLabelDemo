//

import UIKit

/**
 The purpose of this class is to support Dynamic Type for a custom font. The goal is to make the implementation as simple as possible. Just set a label's class to this subclass in the Interface Builder inspector. You don't need to also set the IBOutlet type to this subclass, it can remain a UILabel. You can also use this subclass in code instead of UILabel. This is implemented as a subclass rather than an extension because we need to keep a reference to a label's original font to support cell reuse in a scrolling table view. 
 */
class DynamicTypeLabel: UILabel {
    
    private var initialFont: UIFont?


    override init(frame: CGRect) {
        super.init(frame: frame)
        common()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        common()
    }

    private func common() {
        self.initialFont = font
        adjustsFontForContentSizeCategory = true

        if let initialFont = self.initialFont {
            self.font = UIFontMetrics.default.scaledFont(for: initialFont)
        }

        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: nil, queue: OperationQueue.main) { [weak self] (notification: Notification) in
            if let initialFont = self?.initialFont {
                self?.font = UIFontMetrics.default.scaledFont(for: initialFont)
            }

        }

    }
    
    
}
