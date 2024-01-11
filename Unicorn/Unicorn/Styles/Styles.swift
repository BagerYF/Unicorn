//
//  Styles.swift
//  Unicorn
//
//  Created by Bager on 2023/12/21.
//

import SwiftUI

struct TextBlack12: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(.black)
    }
}

struct TextGrey75757512: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(Color(AppColor.grey_757575))
    }
}

struct TextBlack14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(Color(AppColor.black))
    }
}

struct TextWhite14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(.white)
    }
}

struct TextGrey75757514: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(Color(AppColor.grey_757575))
    }
}

struct TextGrey9E9E9E14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(Color(AppColor.grey_9e9e9e))
    }
}

struct TextRed14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(.red)
    }
}

struct TextBlack16: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(Color(AppColor.black))
    }
}

struct TextGrey9E9E9E16: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(Color(AppColor.grey_9e9e9e))
    }
}

struct TextBlackBold16: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(Color(AppColor.black))
    }
}

struct TextRed16: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(.red)
    }
}

struct TextBlack20: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundColor(Color(AppColor.black))
    }
}

struct TextBlack24: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
            .foregroundColor(Color(AppColor.black))
    }
}

struct EqualWidthHStack: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        // Return a size.
        guard !subviews.isEmpty else { return .zero }

        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(0) { $0 + $1 }

        return CGSize(
            width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
            height: maxSize.height)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        // Place child views.
        guard !subviews.isEmpty else { return }

        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)

        let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
        var x = bounds.minX + maxSize.width / 2

        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: x, y: bounds.midY),
                anchor: .center,
                proposal: placementProposal)
            x += maxSize.width + spacing[index]
        }
    }

    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero) { currentMax, subviewSize in
            CGSize(
                width: max(currentMax.width, subviewSize.width),
                height: max(currentMax.height, subviewSize.height))
        }

        return maxSize
    }

    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            return subviews[index].spacing.distance(
                to: subviews[index + 1].spacing,
                along: .horizontal)
        }
    }
}



