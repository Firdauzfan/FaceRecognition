function add_face(){
  const {PythonShell} = require('python-shell');
  var path = require("path");
  var name = document.getElementById("person").value
  console.log(name);

  var options = {
    scriptPath : path.join(__dirname, '/../'),
    mode: 'text',
    encoding: 'utf8',
    pythonPath: '/usr/bin/python3',
    pythonOptions: ['-u'], // get print results in real-time
    args : [name]
  };
  console.log(options);
  var face = new PythonShell("training_face.py", options);
  console.log(face);
  
  face.end(function(err, code, message) {
    swal({
      title: "Your Face Data has been Saved?",
      text: "If you click 'OK', you will be redirected to Home",
      type: "success",
      showCancelButton: true
    }, function() {
      // Redirect the user
      window.location.href = "index.html";
      console.log(window.location.href)
    });


  })

}
