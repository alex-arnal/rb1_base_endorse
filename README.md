# rb1_base_endorse

## Install:

```bash
git clone --recurse-submodules https://github.com/alex-arnal/rb1_base_endorse
sudo apt install mosquitto mosquitto-clients
```

## Run:

Launch mosquitto server:

```bash
$> mosquitto
```

Launch full simulation:

```bash
$> roslaunch rb1_base_endorse_bringup endorse_sim_complete.launch
```

Launch MQTT/ROS bridge:

```bash
$> ROS_NAMESPACE=rb1_base roslaunch rb1_base_endorse_bringup mqtt_bridge.launch
```

Launch command interface:

```bash
$> ROS_NAMESPACE=rb1_base roslaunch rb1_base_endorse_bringup command_complete.launch
```

Send command through ROS:

```bash
$> rostopic pub /rb1_base/command_manager/command robot_simple_command_manager_msgs/CommandString "command: 'GOTO 2 0 1'"
```

Send command through MQTT:

```bash
$> mosquitto_pub -t endorse/robot_1/commands -m "{\"command\": \"GOTO -2 0 1\"}"
```
