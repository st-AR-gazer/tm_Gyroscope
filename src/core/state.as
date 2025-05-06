namespace GyroCore {

    class State {
        vec3 left, up, dir;
        bool hasCar = false;

        void Update() {
            auto vehicle = VehicleState::GetViewingPlayer();
            hasCar = vehicle !is null;
            if (!hasCar) return;

            left = vehicle.Left;
            up   = vehicle.Up;
            dir  = vehicle.Dir;
        }
    }

    State g_state;

}