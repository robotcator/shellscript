# https://gist.github.com/machinaut/b5a7c6719a30e9fbfd95c13d5e963b61
apt-get update && apt-get install -y python3-pip curl unzip \
    libosmesa-dev libglew-dev patchelf libglfw3-dev

# Download mujoco
curl https://www.roboti.us/download/mjpro150_linux.zip --output /tmp/mujoco.zip && \
    mkdir -p /root/.mujoco && \
    unzip /tmp/mujoco.zip -d /root/.mujoco && \
    rm -f /tmp/mujoco.zip

# Set library load path
echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mjpro150/bin' >> .bashrc

# Copy the mujoco license key
cp mjkey.txt /root/.mujoco/mjkey.txt

# Install gym with mujoco
pip install gym[mujoco]

# Test the python packages
python3 -c "import gym; gym.make('Humanoid-v2')"