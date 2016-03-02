//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Jan Vrzal on 02.03.16.
//  Copyright © 2016 OhYeahSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    var timer = NSTimer()
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var lap: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func startButton(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButton(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timeLabel.text = "0.0"
        counter = 0.0
        timer.invalidate()
    }
    
    @IBAction func lapButton(sender: AnyObject) {
    }
    
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cornerRadius:CGFloat = 10
        
        reset.layer.cornerRadius = cornerRadius
        start.layer.cornerRadius = cornerRadius
        stop.layer.cornerRadius = cornerRadius
        lap.layer.cornerRadius = cornerRadius
        tableView.layer.cornerRadius = cornerRadius
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update(){
        timeLabel.text = String(Double(counter)/10)
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        return cell
    }
    
    
}

