//
//  View+MortarCoordinate.swift
//  Copyright © 2025 Jason Fieldman.
//

public extension MortarView {
    var layout: MortarAnchorProvider {
        .init(item: self)
    }

    var safeLayout: MortarAnchorProvider {
        .init(item: safeAreaLayoutGuide)
    }

    var parentLayout: MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.parent(self) { $0 })
    }

    var parentSafeAreaLayout: MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.parent(self) { $0.safeAreaLayoutGuide })
    }

    func referencedLayout(_ referenceId: String) -> MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.reference(referenceId) { $0 })
    }

    func referencedSafeAreaLayout(_ referenceId: String) -> MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.reference(referenceId) { $0.safeAreaLayoutGuide })
    }

    var layoutReferenceId: String? {
        get {
            MortarMainThreadLayoutStack.shared.layoutReferenceIdFor(view: self)
        }
        set {
            MortarMainThreadLayoutStack.shared.addLayoutReference(id: newValue, view: self)
        }
    }
}

#if os(iOS) || os(tvOS)

public extension MortarView {
    var keyboardLayout: MortarAnchorProvider {
        .init(item: keyboardLayoutGuide)
    }

    var parentKeyboardLayout: MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.parent(self) { $0.keyboardLayoutGuide })
    }

    func referencedLeyboardLayout(_ referenceId: String) -> MortarAnchorProvider {
        .init(item: MortarRelativeAnchor.reference(referenceId) { $0.keyboardLayoutGuide })
    }
}

#endif
