//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Mark Meretzky on 2/3/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti",description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue 'z's.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ];

    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // navigationItem.rightBarButtonItem = editButtonItem;   //p. 618
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData();   //pp. 619
    }

    // MARK: - Table view data source, p. 611.

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;   //p. 612
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else {
            fatalError("This UITableView has no section number \(section).");
        }
        
        return emojis.count;   //p. 613
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else {
            fatalError("This UITableView has no section number \(indexPath.section).");
        }
 
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath); //pp. 613-614

        // Configure the cell...
        let emoji: Emoji = emojis[indexPath.row];
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)";
        cell.detailTextLabel?.text = emoji.description;
        cell.selectionStyle = .default;   //p. 616
        cell.showsReorderControl = true;  //p. 617
        return cell;
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true;
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade);
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // Override to support rearranging the table view, p. 618.
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji: Emoji = emojis.remove(at: fromIndexPath.row);
        emojis.insert(movedEmoji, at: to.row);
        tableView.reloadData();
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji: Emoji = emojis[indexPath.row];
        print("\(emoji.symbol) \(indexPath)");
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none   //p. 618
    }

    //Toggle the editing mode, p. 617.
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode: Bool = tableView.isEditing;
        tableView.setEditing(!tableViewEditingMode, animated: true);
        
        //Toggle the button between the words Edit and Done.
        let systemItem: UIBarButtonItem.SystemItem = tableView.isEditing ? UIBarButtonItem.SystemItem.done : UIBarButtonItem.SystemItem.edit;
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: #selector(editButtonTapped(_:)));
        navigationItem.leftBarButtonItem = button;
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true;
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
