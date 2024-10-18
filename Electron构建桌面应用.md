# Electron构建桌面应用

Electron的是npm下载的JS包,采用ES6导入,核心是app和BrowserWindow,**app.on**开启进程,然后new Browserwindow代表创建窗口

```js
const {app,BrowserWindow,ipcMain} = require("electron")
const path = require('path')
const fs = require('fs')

function writeFile(event,data){
    console.log("Hi",event,data);
    fs.writeFileSync("/Users/leojackasher/Documents/Word/electron.txt",data)
}

function readFile(){
    return fs.readFileSync('/Users/leojackasher/Documents/Word/electron.txt').toString()
}
app.on('ready',() => {
    const win = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            preload:path.resolve(__dirname,'./preload.js')
        }
    })

    ipcMain.on('file-save',writeFile)
    ipcMain.handle('file-read',readFile)
    win.loadFile('./pages/index.html')
    // win.loadURL("http://www.jackasher.com")
})
```

## 代码解释

用于注册预加载脚本,实现让nodejs和Chrome之间的通信,

```js
webPreferences: {
            preload:path.resolve(__dirname,'./preload.js')
        }
```

用于接受来自预加载脚本的数据,而该数据来源于渲染端

```js
ipcMain.on('file-save',writeFile)
    ipcMain.handle('file-read',readFile)
```

## 预加载脚本

主要实现通信,contextBridge可以将属性注册到Window,渲染端可以拿到该数据,ipcRenderer用于接受渲染端数据,将调动主进程的程序

```js
const {contextBridge,ipcRenderer} = require('electron')

contextBridge.exposeInMainWorld('myApi',{
    name: 'jack',
    saveFile: function(data){
        ipcRenderer.send('file-save',data)
    },
    readFile: () => {
        return ipcRenderer.invoke('file-read')
    }
})

```

win打包配置文件

```json
{
  "name": "electron",
  "version": "1.0.0",
  "description": "A desktop application",
  "main": "index.js",
  "scripts": {
    "start2": "nodemon --exec electron .",
    "start": "electron .",
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "electron-builder --win --x64"
  },
  "build": {
    "productName": "Jtest",
    "appId": "com.jackasher.app",
    "copyright": "© 2024 Jackasher",
    "directories": {
      "output": "build"
    },
    "win": {
      "target": [
        {
          "target": "nsis",
          "arch": [
            "x64"
          ]
        }
      ],
      "icon": "./jack.ico"
    },
    "asar": true,
    "nsis": {
      "oneClick": false,
      "allowToChangeInstallationDirectory": true,
      "createDesktopShortcut": true
    }
  },
  "keywords": [],
  "author": "Jackasher",
  "license": "ISC",
  "devDependencies": {
    "electron": "^31.2.1",
    "electron-builder": "^24.13.3",
    "nodemon": "^3.0.0"
  },
  "dependencies": {
    "path": "^0.12.7"
  }
}
```

