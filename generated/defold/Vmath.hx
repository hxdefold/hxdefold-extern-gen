package defold;

/**
    Functions for mathematical operations on vectors, matrices and quaternions.
**/
@:native("_G.vmath")
extern class Vmath {
    /**
        Calculates the conjugate of a quaternion.
        
        Calculates the conjugate of a quaternion. The result is a
        quaternion with the same magnitudes but with the sign of
        the imaginary (vector) parts changed:
        
        `q<super>*</super> = [w, -v]`
        
        @param q quaternion of which to calculate the conjugate (quaternion)
        @return the conjugate (quaternion)
    **/
    static function conj(q:TODO<"quaternion">):TODO;

    /**
        Calculates the cross-product of two vectors.
        
        Given two linearly independent vectors P and Q, the cross product,
        P &#x00D7; Q, is a vector that is perpendicular to both P and Q and
        therefore normal to the plane containing them.
        
        If the two vectors have the same direction (or have the exact
        opposite direction from one another, i.e. are not linearly independent)
        or if either one has zero length, then their cross product is zero.
        
        @param v1 first vector (vector3)
        @param v2 second vector (vector3)
        @return a new vector representing the cross product (vector3)
    **/
    static function cross(v1:Vector3, v2:Vector3):TODO;

    /**
        Calculates the dot-product of two vectors.
        
        The returned value is a scalar defined as:
        
        `P &#x22C5; Q = |P| |Q| cos &#x03B8;`
        
        where &#x03B8; is the angle between the vectors P and Q.
        
         * If the dot product is >1.0 then the vectors are both pointing in the same direction.
         * If the dot product is zero the vectors are perpendicular (at right-angles to each other).
         * If the dot product is < 1.0 then the vectors are pointing in opposite directions.
        
        @param v1 first vector (vector3 or vector4)
        @param v1 second vector (vector3 or vector4)
        @return dot product (number)
    **/
    static function dot(v1:EitherType<Vector4, Vector3>, v1:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the inverse matrix..
        
        The resulting matrix is the inverse of the supplied matrix.
        
        For ortho-normal matrices, e.g. regular object transformation,
        use `vmath.ortho_inv()` instead.
        The specialized inverse for ortho-normalized matrices is much faster
        than the general inverse.
        
        @param m matrix to invert (matrix4)
        @return inverse of the supplied matrix (matrix4)
    **/
    static function inv(m:TODO<"matrix4">):TODO;

    /**
        Calculates the vector length.
        
        Returns the length of the supplied vector.
        
        @param v vector of which to calculate the length (vector3 or vector4)
        @return vector length (number)
    **/
    static function length(v:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the squared vector length.
        
        Returns the squared length of the supplied vector.
        
        @param v vector of which to calculate the squared length (vector3 or vector4)
        @return squared vector length (number)
    **/
    static function length_sqr(v:EitherType<Vector4, Vector3>):TODO;

    /**
        Lerps between two vectors.
        
        Linearly interpolate between two vectors. The function
        treats the vectors as positions and interpolates between
        the positions in a straight line. Lerp is useful to describe
        transitions from one place to another over time.
        
        The function does not clamp t between 0 and 1.
        
        @param t interpolation parameter, 0-1 (number)
        @param v1 vector to lerp from (vector3 or vector4)
        @param v2 vector to lerp to (vector3 or vector4)
        @return the lerped vector (vector3 or vector4)
    **/
    static function lerp(t:Float, v1:EitherType<Vector4, Vector3>, v2:EitherType<Vector4, Vector3>):TODO;

    /**
        Lerps between two quaternions.
        
        Linearly interpolate between two quaternions. Linear
        interpolation of rotations are only useful for small
        rotations. For interpolations of arbitrary rotations,
        `vmath.slerp()` yields much better results.
        
        The function does not clamp t between 0 and 1.
        
        @param t interpolation parameter, 0-1 (number)
        @param q1 quaternion to lerp from (quaternion)
        @param q2 quaternion to lerp to (quaternion)
        @return the lerped quaternion (quaternion)
    **/
    static function lerp(t:Float, q1:TODO<"quaternion">, q2:TODO<"quaternion">):TODO;

    /**
        Lerps between two numbers.
        
        Linearly interpolate between two values. Lerp is useful
        to describe transitions from one value to another over time.
        
        The function does not clamp t between 0 and 1.
        
        @param t interpolation parameter, 0-1 (number)
        @param n1 number to lerp from (number)
        @param n2 number to lerp to (number)
        @return the lerped number (number)
    **/
    static function lerp(t:Float, n1:Float, n2:Float):TODO;

    /**
        Creates a new identity matrix.
        
        The resulting identity matrix describes a transform with
        no translation or rotation.
        
        @return identity matrix (matrix4)
    **/
    static function matrix4():TODO;

    /**
        Creates a new matrix from another existing matrix.
        
        Creates a new matrix with all components set to the
        corresponding values from the supplied matrix. I.e.
        the function creates a copy of the given matrix.
        
        @param m existing matrix (matrix4)
        @return matrix which is a copy of the specified matrix (matrix4)
    **/
    static function matrix4(m:TODO<"matrix4">):TODO;

    /**
        Creates a matrix from an axis and an angle.
        
        The resulting matrix describes a rotation around the axis by the specified angle.
        
        @param v axis (vector3)
        @param angle angle in radians (number)
        @return matrix represented by axis and angle (matrix4)
    **/
    static function matrix4_axis_angle(v:Vector3, angle:Float):TODO;

    /**
        Creates a matrix from a quaternion.
        
        The resulting matrix describes the same rotation as the quaternion, but does not have any translation (also like the quaternion).
        
        @param q quaternion to create matrix from (quaternion)
        @return matrix represented by quaternion (matrix4)
    **/
    static function matrix4_from_quat(q:TODO<"quaternion">):TODO;

    /**
        Creates a frustum matrix.
        
        Constructs a frustum matrix from the given values. The left, right,
        top and bottom coordinates of the view cone are expressed as distances
        from the center of the near clipping plane. The near and far coordinates
        are expressed as distances from the tip of the view frustum cone.
        
        @param left coordinate for left clipping plane (number)
        @param right coordinate for right clipping plane (number)
        @param bottom coordinate for bottom clipping plane (number)
        @param top coordinate for top clipping plane (number)
        @param near coordinate for near clipping plane (number)
        @param far coordinate for far clipping plane (number)
        @return matrix representing the frustum (matrix4)
    **/
    static function matrix4_frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):TODO;

    /**
        Creates a look-at view matrix.
        
        The resulting matrix is created from the supplied look-at parameters.
        This is useful for constructing a view matrix for a camera or
        rendering in general.
        
        @param eye eye position (vector3)
        @param look_at look-at position (vector3)
        @param up up vector (vector3)
        @return look-at matrix (matrix4)
    **/
    static function matrix4_look_at(eye:Vector3, look_at:Vector3, up:Vector3):TODO;

    /**
        Creates an orthographic projection matrix.
        
        Creates an orthographic projection matrix.
        This is useful to construct a projection matrix for a camera or rendering in general.
        
        @param left coordinate for left clipping plane (number)
        @param right coordinate for right clipping plane (number)
        @param bottom coordinate for bottom clipping plane (number)
        @param top coordinate for top clipping plane (number)
        @param near coordinate for near clipping plane (number)
        @param far coordinate for far clipping plane (number)
        @return orthographic projection matrix (matrix4)
    **/
    static function matrix4_orthographic(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):TODO;

    /**
        Creates a perspective projection matrix.
        
        Creates a perspective projection matrix.
        This is useful to construct a projection matrix for a camera or rendering in general.
        
        @param fov angle of the full vertical field of view in radians (number)
        @param aspect aspect ratio (number)
        @param near coordinate for near clipping plane (number)
        @param far coordinate for far clipping plane (number)
        @return perspective projection matrix (matrix4)
    **/
    static function matrix4_perspective(fov:Float, aspect:Float, near:Float, far:Float):TODO;

    /**
        Creates a matrix from rotation around x-axis.
        
        The resulting matrix describes a rotation around the x-axis
        by the specified angle.
        
        @param angle angle in radians around x-axis (number)
        @return matrix from rotation around x-axis (matrix4)
    **/
    static function matrix4_rotation_x(angle:Float):TODO;

    /**
        Creates a matrix from rotation around y-axis.
        
        The resulting matrix describes a rotation around the y-axis
        by the specified angle.
        
        @param angle angle in radians around y-axis (number)
        @return matrix from rotation around y-axis (matrix4)
    **/
    static function matrix4_rotation_y(angle:Float):TODO;

    /**
        Creates a matrix from rotation around z-axis.
        
        The resulting matrix describes a rotation around the z-axis
        by the specified angle.
        
        @param angle angle in radians around z-axis (number)
        @return matrix from rotation around z-axis (matrix4)
    **/
    static function matrix4_rotation_z(angle:Float):TODO;

    /**
        Normalizes a vector.
        
        Normalizes a vector, i.e. returns a new vector with the same
        direction as the input vector, but with length 1.
        
        The length of the vector must be above 0, otherwise a
        division-by-zero will occur.
        
        @param v vector to normalize (vector3|vector4)
        @return new normalized vector (vector3|vector4)
    **/
    static function normalize(v:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the inverse of an ortho-normal matrix..
        
        The resulting matrix is the inverse of the supplied matrix.
        The supplied matrix has to be an ortho-normal matrix, e.g.
        describe a regular object transformation.
        
        For matrices that are not ortho-normal
        use the general inverse `vmath.inv()` instead.
        
        @param m ortho-normalized matrix to invert (matrix4)
        @return inverse of the supplied matrix (matrix4)
    **/
    static function ortho_inv(m:TODO<"matrix4">):TODO;

    /**
        Projects a vector onto another vector.
        
        Calculates the extent the projection of the first vector onto the second.
        The returned value is a scalar p defined as:
        
        `p = |P| cos &#x03B8; / |Q|`
        
        where &#x03B8; is the angle between the vectors P and Q.
        
        @param v1 vector to be projected on the second (vector3)
        @param v2 vector onto which the first will be projected, must not have zero length (vector3)
        @return the projected extent of the first vector onto the second (number)
    **/
    static function project(v1:Vector3, v2:Vector3):TODO;

    /**
        Creates a new identity quaternion.
        
        Creates a new identity quaternion. The identity
        quaternion is equal to:
        
        `vmath.quat(0, 0, 0, 1)`
        
        @return new identity quaternion (quaternion)
    **/
    static function quat():TODO;

    /**
        Creates a new quaternion from another existing quaternion.
        
        Creates a new quaternion with all components set to the
        corresponding values from the supplied quaternion. I.e.
        This function creates a copy of the given quaternion.
        
        @param q existing quaternion (quaternion)
        @return new quaternion (quaternion)
    **/
    static function quat(q:TODO<"quaternion">):TODO;

    /**
        Creates a new quaternion from its coordinates.
        
        Creates a new quaternion with the components set
        according to the supplied parameter values.
        
        @param x x coordinate (number)
        @param y y coordinate (number)
        @param z z coordinate (number)
        @param w w coordinate (number)
        @return new quaternion (quaternion)
    **/
    static function quat(x:Float, y:Float, z:Float, w:Float):TODO;

    /**
        Creates a quaternion to rotate around a unit-length vector.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the axis described by the unit length vector `v`.
        
        @param v axis (vector3)
        @param angle angle (number)
        @return quaternion representing the axis-angle rotation (quaternion)
    **/
    static function quat_axis_angle(v:Vector3, angle:Float):TODO;

    /**
        Creates a quaternion from three base unit length vectors.
        
        The resulting quaternion describes the rotation from the
        identity quaternion (no rotation) to the coordinate system
        as described by the given x, y and z base unit length vectors.
        
        @param x x base vector (vector3)
        @param y y base vector (vector3)
        @param z z base vector (vector3)
        @return quaternion representing the rotation of the specified base vectors (quaternion)
    **/
    static function quat_basis(x:Vector3, y:Vector3, z:Vector3):TODO;

    /**
        Creates a quaternion to rotate between two unit length vectors.
        
        The resulting quaternion describes the rotation that,
        if applied to the first vector, would rotate the first
        vector to the second. The two vectors must be unit
        length vectors (of length 1).
        
        The result is undefined if the two vectors point in opposite directions
        
        @param v1 first unit vector, before rotation (vector3)
        @param v2 second unit vector, after rotation (vector3)
        @return quaternion representing the rotation from first to second vector (quaternion)
    **/
    static function quat_from_to(v1:Vector3, v2:Vector3):TODO;

    /**
        Creates a quaternion from rotation around x-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the x-axis.
        
        @param angle angle in radians around x-axis (number)
        @return quaternion representing the rotation around the x-axis (quaternion)
    **/
    static function quat_rotation_x(angle:Float):TODO;

    /**
        Creates a quaternion from rotation around y-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the y-axis.
        
        @param angle angle in radians around y-axis (number)
        @return quaternion representing the rotation around the y-axis (quaternion)
    **/
    static function quat_rotation_y(angle:Float):TODO;

    /**
        Creates a quaternion from rotation around z-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the z-axis.
        
        @param angle angle in radians around z-axis (number)
        @return quaternion representing the rotation around the z-axis (quaternion)
    **/
    static function quat_rotation_z(angle:Float):TODO;

    /**
        Rotates a vector by a quaternion.
        
        Returns a new vector from the supplied vector that is
        rotated by the rotation described by the supplied
        quaternion.
        
        @param q quaternion (quaternion)
        @param v vector to rotate (vector3)
        @return the rotated vector (vector3)
    **/
    static function rotate(q:TODO<"quaternion">, v:Vector3):TODO;

    /**
        Slerps between two vectors.
        
        Spherically interpolates between two vectors. The difference to
        lerp is that slerp treats the vectors as directions instead of
        positions in space.
        
        The direction of the returned vector is interpolated by the angle
        and the magnitude is interpolated between the magnitudes of the
        from and to vectors.
        
        Slerp is computationally more expensive than lerp.
        
        The function does not clamp t between 0 and 1.
        
        @param t interpolation parameter, 0-1 (number)
        @param v1 vector to slerp from (vector3 or vector4)
        @param v2 vector to slerp to (vector3 or vector4)
        @return the slerped vector (vector3 or vector4)
    **/
    static function slerp(t:Float, v1:EitherType<Vector4, Vector3>, v2:EitherType<Vector4, Vector3>):TODO;

    /**
        Slerps between two quaternions.
        
        Slerp travels the torque-minimal path maintaining constant
        velocity, which means it travels along the straightest path along
        the rounded surface of a sphere. Slerp is useful for interpolation
        of rotations.
        
        Slerp travels the torque-minimal path, which means it travels
        along the straightest path the rounded surface of a sphere.
        
        The function does not clamp t between 0 and 1.
        
        @param t interpolation parameter, 0-1 (number)
        @param q1 quaternion to slerp from (quaternion)
        @param q2 quaternion to slerp to (quaternion)
        @return the slerped quaternion (quaternion)
    **/
    static function slerp(t:Float, q1:TODO<"quaternion">, q2:TODO<"quaternion">):TODO;

    /**
        Creates a new vector from a table of values.
        
        @param t table of numbers
        @return new vector (vector)
    **/
    static function vector(t:TODO):TODO;

    /**
        Creates a new zero vector.
        
        Creates a new zero vector with all components set to 0.
        
        @return new zero vector (vector3)
    **/
    static function vector3():TODO;

    /**
        Creates a new vector from scalar value.
        
        Creates a new vector with all components set to the
        supplied scalar value.
        
        @param n scalar value to splat (number)
        @return new vector (vector3)
    **/
    static function vector3(n:Float):TODO;

    /**
        Creates a new vector from another existing vector.
        
        Creates a new vector with all components set to the
        corresponding values from the supplied vector. I.e.
        This function creates a copy of the given vector.
        
        @param v existing vector (vector3)
        @return new vector (vector3)
    **/
    static function vector3(v:Vector3):TODO;

    /**
        Creates a new vector from its coordinates.
        
        Creates a new vector with the components set to the
        supplied values.
        
        @param x x coordinate (number)
        @param y y coordinate (number)
        @param z z coordinate (number)
        @return new vector (vector3)
    **/
    static function vector3(x:Float, y:Float, z:Float):TODO;

    /**
        Creates a new zero vector.
        
        Creates a new zero vector with all components set to 0.
        
        @return new zero vector (vector4)
    **/
    static function vector4():TODO;

    /**
        Creates a new vector from scalar value.
        
        Creates a new vector with all components set to the
        supplied scalar value.
        
        @param n scalar value to splat (number)
        @return new vector (vector4)
    **/
    static function vector4(n:Float):TODO;

    /**
        Creates a new vector from another existing vector.
        
        Creates a new vector with all components set to the
        corresponding values from the supplied vector. I.e.
        This function creates a copy of the given vector.
        
        @param v existing vector (vector4)
        @return new vector (vector4)
    **/
    static function vector4(v:Vector4):TODO;

    /**
        Creates a new vector from its coordinates.
        
        Creates a new vector with the components set to the
        supplied values.
        
        @param x x coordinate (number)
        @param y y coordinate (number)
        @param z z coordinate (number)
        @param w w coordinate (number)
        @return new vector (vector4)
    **/
    static function vector4(x:Float, y:Float, z:Float, w:Float):TODO;
}