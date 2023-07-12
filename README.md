# export-slack-emojis
Repo with a script to export Slack emojis from a Slack Workspace

For this you would require:
- Ruby installed so you can execute the script in this repo via CLI


The script requires a manual intervention to work, which is going to be described here in detail:
1) Access the workspace emoji page, the UI where you can view/add/remove emojis, [it's usually here](https://squaretrade-eng.slack.com/customize/emoji?utm_source=in-prod&utm_medium=inprod-customize_link-slack_menu-click)
2) Right-click on the screen, select "Inspect Elements", go to the "Network" tab. Select the option "Fetch/XHR"
3) Scroll down the emoji list on the Main Screen while the previous network tab is Open, you should see a request like this `https://XXX.slack.com/api/emoji.adminList?_x_id=944`, this is the request the UI does to retrieve the Emojis, click on this request and click on the "Response", you should see a JSON object, copy it and save a file called `emojis.json` in the same folder the script of this repo `download.rb` is.
4) Run the ruby script by accessing the folder with both the script and the JSON file `ruby download.rb`
5) Go again to the emoji page and keep scrolling and you see another `emoji.adminList?` request and repeat the process of:
    - Copying the JSON response into the `emojis.json`,
    - Run the ruby script

This is required because Slack loads the emojis as you're scrolling the page down, depending on how many emojis your Slack space has, you'll need to do it a couple of times. 
