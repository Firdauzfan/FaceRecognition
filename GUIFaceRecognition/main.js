const electron = require('electron')

const app = electron.app

const BrowserWindow = electron.BrowserWindow

const path = require('path')
const url = require('url')

let mainWindow

function createWindow () {

  mainWindow = new BrowserWindow({width: 800, height: 600, icon:__dirname+'/images/recognition.png'})

  mainWindow.loadURL(url.format({
    pathname: path.join(__dirname, 'login.html'),
    protocol: 'file:',
    slashes: true
  }))

  mainWindow.on('closed', function () {

    mainWindow = null
  })
}

app.on('ready', createWindow)

app.on('window-all-closed', function () {

    app.quit()
})

app.on('activate', function () {
  if (mainWindow === null) {
    createWindow()
  }
})
