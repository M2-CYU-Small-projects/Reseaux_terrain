package fr.cyu.rt.control.api.rest.camera;

import fr.cyu.rt.control.api.stomp.house.EventMessage;
import fr.cyu.rt.control.api.stomp.user.camera.CameraCommandMessage;
import fr.cyu.rt.control.business.event.EventType;
import fr.cyu.rt.control.services.camera.CameraRegistry;
import fr.cyu.rt.control.services.event.EventService;
import fr.cyu.rt.control.services.user.ConnectedUserRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Aldric Vitali Silvestre
 */
@RestController
@RequestMapping("camera")
public class CameraController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CameraController.class);

    @Autowired
    private ConnectedUserRegistry userRegistry;

    @Autowired
    private CameraRegistry cameraRegistry;

    @Autowired
    private EventService eventService;

    @Autowired
    private SimpMessagingTemplate template;

    @PostMapping("start-control")
    public ResponseEntity<Void> startCameraControl() throws Exception {
        LOGGER.debug("On start control");
        if (!userRegistry.isHouseAlive()) {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE)
                    .build();
        }
        if (cameraRegistry.isUserControlling()) {
            // Already in control
            LOGGER.debug("Camera already under user control");
            return ResponseEntity.ok().build();
        }
        eventService.onCameraControlStart();
        template.convertAndSend("/topic/house/event", new EventMessage(EventType.USER_CONTROL));
        return ResponseEntity.ok().build();
    }

    @PostMapping("control")
    public ResponseEntity<Void> controlCamera(@RequestBody CameraCommandMessage request) throws Exception {
        LOGGER.debug("On control : {}, {}", request.angleX(), request.angleY());
        if (!cameraRegistry.isUserControlling()) {
            throw new IllegalArgumentException("User is not controlling the camera");
        }
        template.convertAndSend("/topic/house/camera", request);
        return ResponseEntity.ok().build();
    }

    @PostMapping("end-control")
    public ResponseEntity<Void> endCameraControl() throws Exception {
        LOGGER.debug("On end control");
        if (!userRegistry.isHouseAlive()) {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE)
                    .build();
        }
        if (!cameraRegistry.isUserControlling()) {
            // Already in control
            LOGGER.debug("Camera already not under user control");
            return ResponseEntity.ok().build();
        }
        eventService.onCameraControlEnd();
        template.convertAndSend("/topic/house/event", new EventMessage(EventType.USER_CONTROL_END));
        return ResponseEntity.ok().build();
    }
}
