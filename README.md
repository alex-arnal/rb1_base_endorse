# rb1_base_endorse

## Install

Clone the repository:

```bash
git clone --recurse-submodules https://github.com/alex-arnal/rb1_base_endorse
```

Install mosquitto:

```bash
sudo apt install mosquitto mosquitto-clients
```

## Run

Launch mosquitto server:

```bash
$> mosquitto
```

Launch full simulation:

```bash
$> roslaunch rb1_base_endorse_bringup endorse_sim_complete.launch
```

The endorse_sim_complete.launch is configured to launch three robots by default. This can be configured through the run launch_robot_a, launch_robot_b and launch_robot_c arguments.

Launch MQTT/ROS bridge:

```bash
$> ROS_NAMESPACE=rb1_base roslaunch rb1_base_endorse_bringup mqtt_bridge.launch
```

Launch command interface:

```bash
$> roslaunch rb1_base_endorse_bringup command_complete.launch
```

The command_complete.launch is configured to launch a command_manager in the namespaces of each robot by default. This can be configured through the run launch_robot_a, launch_robot_b and launch_robot_c arguments.

Send command through ROS:

- Robot 1:

```bash
$> rostopic pub /rb1_base_a/command_manager/command robot_simple_command_manager_msgs/CommandString "command: 'GOTO 2 0 1'"
```

- Robot 2:

```bash
$> rostopic pub /rb1_base_b/command_manager/command robot_simple_command_manager_msgs/CommandString "command: 'GOTO 2 0 1'"
```

- Robot 3:

```bash
$> rostopic pub /rb1_base_a/command_manager/command robot_simple_command_manager_msgs/CommandString "command: 'GOTO 2 0 1'"
```

Send command through MQTT:

- Robot 1:

```bash
$> mosquitto_pub -t endorse/robot_1/commands -m "{\"command\": \"GOTO -2 0 1\"}"
```

- Robot 2:

```bash
$> mosquitto_pub -t endorse/robot_2/commands -m "{\"command\": \"GOTO -2 0 1\"}"
```

- Robot 3:

```bash
$> mosquitto_pub -t endorse/robot_3/commands -m "{\"command\": \"GOTO -2 0 1\"}"
```
