# CuraSLicerDocker
It is a Docker that is supposed to be able to accept command line arguments that contain the STL path and Gcode output path.However, there are some settings that are not properly being imported for Cura to accept the command line. 

Instructions: 

- In the root of project directory run 'docker build -t cura-cli .' to build the docker image
- To slice a file run 'docker run --rm -v "/path/to/input:/input" -v "/path/to/output:/output" cura-cli --input /input/model.stl --output /output/test.gcode --settings /input/settings.json' be sure to replace the file names to the correct settings

Troubleshooting:

- To test different outputs within the docker and to see the docker errors properly run 'docker run -it --entrypoint /bin/bash -v "/path/to/input:/input" -v "/path/to/output:/output" cura-cli'
- Once the docker is running with acces to the docker, navigate to Curaengine/build
- Toe execute a slicing command run './CuraEngine slice -j "$SETTINGS_FILE" -l "$INPUT_FILE" -o "$OUTPUT_FILE"' 


# CuraSLicerDocker
It is a Docker that is supposed to be able to accept command line arguments that contain the STL path and Gcode output path.However, there are some settings that are not properly being imported for Cura to accept the command line. 
