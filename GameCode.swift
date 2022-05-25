import Foundation

//let circle = OvalShape(width: 50, height: 50)
let barrierWidth = 300.0
let barrierHeight = 25.0

fileprivate let barrierPoints = [Point(x: 0, y: 0),Point(x: 0, y: barrierHeight),Point(x: barrierWidth, y: barrierHeight),Point(x: barrierWidth, y: 0), ]

fileprivate let barrier = PolygonShape(points: barrierPoints)


fileprivate let  funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
    
]

fileprivate let funnel = PolygonShape(points: funnelPoints)

fileprivate let targetPoints = [
    Point(x: 10, y: 0),
    Point(x: 0, y: 10),
    Point(x: 10, y: 20),
    Point(x: 20, y: 10)
]

let target = PolygonShape(points:
   targetPoints)

//objects
fileprivate func setupBarrier() {
    barrier.position = Point(x: 240, y: 200)
    barrier.hasPhysics = true
    barrier.isDraggable = true
    barrier.isImmobile = true
    barrier.name = "barrier"
    scene.add(barrier)
}

fileprivate func setupTarget() {
    target.position = Point(x: 200, y: 400)
    target.hasPhysics = true
    target.isDraggable = false
    target.isImmobile = true
    target.name = "target"
    target.isImpermeable = false
    target.fillColor = .yellow

    scene.add(target)
}


fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height - 25)
    funnel.isDraggable = false
    funnel.onTapped = dropBall
    funnel.name = "funnel"
    scene.add(funnel)
}

fileprivate func dropBall() {
    //circle.position = funnel.position
    let ball = OvalShape(width: 50, height: 50)
    ball.stopAllMotion()
    ball.position = funnel.position
    ball.fillColor = .blue
    ball.isDraggable = false
    ball.name = "ball"
    ball.hasPhysics = true
    ball.isImmobile = false
    ball.onCollision = ballCollided(with: )
    scene.add(ball)

}

// Handles collisions between the ball and
fileprivate func ballCollided(with otherShape: Shape) {
    
    if otherShape.name == "target" {
    otherShape.fillColor = .green
    } else {
        return
    }

}

func setup() {

    setupBarrier()
    setupFunnel()
    setupTarget()
}



