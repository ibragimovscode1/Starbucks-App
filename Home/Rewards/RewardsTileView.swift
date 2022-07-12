//
//  RewardTileView.swift
//  Starbucks App
//
//  Created by Rahmetullah on 8.07.2022.
//

import UIKit
class RewardsTileView: UIView {
    
    let balanceView = BalanceView()
    let rewardsButton = UIButton()
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView = StarRewardsView()
    var detailsButton = UIButton()
    
    var heightConstraint: NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
    
}

extension RewardsTileView {
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        detailsButton = makeClearButton(withText: "Details")
        makeRewardsOptionButton()
        
        
        detailsButton.titleLabel?.text = "Details"
        
        
        
        
        
    }
    func makeRewardsOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = .label
        rewardsButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.setTitleColor(.label, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
        func layout() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
            heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            rewardsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            rewardsGraphView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 8),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rewardsGraphView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            starRewardsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            heightConstraint!,
             

            
            detailsButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            detailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
            starRewardsView.isHidden = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}
//MARK: - Selectors
extension RewardsTileView {
        @objc func rewardOptionsTapped() {
                
                if heightConstraint?.constant == 0 {
                    self.setChevronUp()

                    let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                        self.heightConstraint?.constant = 270
                        self.layoutIfNeeded()
                    }
                    heightAnimator.startAnimation()

                    let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                        self.starRewardsView.isHidden = false
                        self.starRewardsView.alpha = 1
                    }
                    alphaAnimator.startAnimation(afterDelay: 0.5)

                } else {
                    self.setChevronDown()

                    let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                        self.heightConstraint?.constant = 0
                        self.starRewardsView.isHidden = true
                        self.starRewardsView.alpha = 0
                        self.layoutIfNeeded()
                    }
                    animator.startAnimation()
                }
            }

            @objc func detailsButtonTapped() {
                print("Details tapped!!!")
            }

            private func setChevronUp() {
                let configuration = UIImage.SymbolConfiguration(scale: .small)
                let image = UIImage(systemName: "chevron.up", withConfiguration: configuration)
                rewardsButton.setImage(image, for: .normal)
            }

            private func setChevronDown() {
                let configuration = UIImage.SymbolConfiguration(scale: .small)
                let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
                rewardsButton.setImage(image, for: .normal)
            }
        }

