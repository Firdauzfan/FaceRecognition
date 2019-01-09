function detect_faces() {

  document.getElementById("detect").value = "Hang on..."
  var path = require("path")
  const {PythonShell} = require('python-shell');

  var options = {
    scriptPath : path.join(__dirname, '/../engine/'),
    mode: 'text',
    encoding: 'utf8',
    pythonPath: '/usr/bin/python3',
    pythonOptions: ['-u'], // get print results in real-time
  };

  var face = new PythonShell("faces.py", options);

  face.end(function(err, code, message) {
    document.getElementById("detect").value = "Detect faces";
    })

}
