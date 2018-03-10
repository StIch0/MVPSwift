//
//  TableViewCell.swift
//  MVPProject
//
//  Created by Pavel Burdukovskii on 10/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {

    override init(frame: CGRect) {
        user_login = UIButton()
        title = UILabel()
        short = UILabel()
        fultext = UITextView()
        date = UILabel()
        img = UIImageView()
        mark = UILabel()
        views = UILabel()        
        super.init(frame: frame)
        setView()
        dislike.addTarget(self, action: #selector(animateMe(_:)), for: .touchDown)
        dislike.addTarget(self, action: #selector(handleDislike(_:)), for: .touchDown)
        like.addTarget(self, action: #selector(animateMe(_:)), for: .touchDown)
        like.addTarget(self, action: #selector(handleLike(_:)), for: .touchDown)
        user_login.addTarget(self, action: #selector(handleUserLoginButton), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var user_login: UIButton
    var profileImageView : UIImageView = UIImageView()
    var title: UILabel
    var short: UILabel
    var fultext: UITextView
    var date: UILabel
    var img: UIImageView
    var images : [String] = Array()
    var docs : [String] = Array()
    var audio : [String] = Array()
    var video : [String] = Array()
    var mark : UILabel
    var views : UILabel 
    var user_mark : Int = 0
    var like : UIButton = UIButton()
    var dislike : UIButton = UIButton() 
    var postId : Int = -1
    var userId : Int = -1
    var spinner : UIActivityIndicatorView = UIActivityIndicatorView()
    
    var controller : UIViewController? = nil
    
    
    
    var dividerLineView : UIView = UIView()      
}

extension NewsCell
{
    func animateMe(_ sender: UIButton)
    {
        UIView.animate(withDuration: 0.05, animations: {
            if (sender.alpha < 0.5) {
                sender.alpha = 0.6
            }
            else {
                sender.alpha = 0.35
            }
        })        
    }
    
    func handleLike (_ sender: UIButton)
    {
        var cntV : Int = (mark.text! as NSString).integerValue
        
        if (dislike.alpha > 0.5) {
            animateMe(dislike)
            cntV = cntV + 2
        }
        else if (like.alpha > 0.5) {
            cntV = cntV + 1
            mark.alpha = 0.6
        }        
        else {
            cntV = cntV - 1
            mark.alpha = 0.35
        }
        mark.text = "\(cntV)"
    }
    
    func handleDislike (_ sender: UIButton)
    {
        var cntV = (mark.text! as NSString).integerValue
        
        if (like.alpha > 0.5) {
            animateMe(like)
            cntV = cntV - 2
        }
        else if (dislike.alpha > 0.5) {
            cntV = cntV - 1
            mark.alpha = 0.6
        }
        else {
            cntV = cntV + 1
            mark.alpha = 0.35
        }
        mark.text = "\(cntV)"
    }
    
    func handleUserLoginButton ()
    {
        print ("qweqweqweqweq")
        let ctrller = UsrInfoViewController()
        ctrller.id = userId
        if let ctrl = controller {
            ctrl.navigationController?.pushViewController(ctrller, animated: true)
        }
    }
}
