function detect_faces() {

  document.getElementById("detect").value = "Hang on..."
  const {PythonShell} = require('python-shell');
  var path = require("path");
  console.log(name);

  var options = {
    scriptPath : path.join(__dirname, '/../'),
    mode: 'text',
    encoding: 'utf8',
    pythonPath: '/usr/bin/python3',
    pythonOptions: ['-u'], // get print results in real-time
  };
  console.log(options);
  var face = new PythonShell("main_facerec_multiprocess2.py", options);

}
