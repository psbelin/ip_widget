## Creating a taskbar IP widget for kali linux (or any distro running XFCE)
It's useful to have handy the IP of the interface that you're using for pentesting or bugbounty. 

The way I've done it uses the xfce-genmon4 widget, which allows to show the output of any one liner. As it restricts the characters you can use (for example pipes are not allowed, and we cant' pipe to grep), the best thing is to write a simple bash script and run it from the widget.

**The widget will show the IP of any interface passed as an argument, and will not display when the interface is down.**

![Appearance](https://github.com/psbelin/ip_widget/blob/master/images/0.png)

## Steps
1. Download the script and make it executable
```bash
wget https://raw.githubusercontent.com/psbelin/ip_widget/master/ip_widget.sh && chmod 700 ip_widget.sh
```
2. Copy it's absolute path.

3. Add a Generic Monitor to the taskbar
`Right click on the task bar -> Panel -> New items -> select "Generic monitor"`

![Steps](https://github.com/psbelin/ip_widget/blob/master/images/1.png)
![Steps](https://github.com/psbelin/ip_widget/blob/master/images/2.png)

4. Configure the Generic Monitor
   - [ ] Right click -> Properties. 
   - [ ] **Command:**   Use the **absolute** path to the downloaded script (the one you copied before), and the interface you want to monitor as an argument (i.e): `/home/your_user/ip_widget.sh tun0`
   - [ ] **Label:**     Uncheck the Label (it uses space in your taskbar)
   - [ ] **Period(s):** Set the frequency on which the script will run (i.e. 10 secs).
   ![Config](https://github.com/psbelin/ip_widget/blob/master/images/3.png)
