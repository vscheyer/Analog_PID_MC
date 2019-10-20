# Analog_PID_MC

### Abstract:
This paper examines analog PID control as it relates to a DC motor controller circuit. Our goal was to analyze controls through analog circuitry. In order to do this we derived op-amp circuits that are analogous to PID control blocks in order to create a velocity control scheme. We simulate a motor model in MATLAB with control coefficients for a specific motor. Then we derive transfer functions for op-amp gain, integrator, and differentiator circuits so we could compare the analog control transfer functions to our MATLAB controls simulation.  Based on analysis of the steady state error and percentage overshoot, we find good control constants Kp = 6000, Ki=3600, and Kd=100 to get the motor to reach a desired velocity in less than 0.025 seconds.
