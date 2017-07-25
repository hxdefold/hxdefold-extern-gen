package defold;

/**
    <p>Functions for mathematical operations on vectors, matrices and quaternions.</p>
    <ul>
    <li>The vector types (<code>vmath.vector3</code> and vmath.vector4`) supports addition, subtraction,
    negation and multiplication with numbers and other vectors of the same type.</li>
    <li>The quaternion type (<code>vmath.quat</code>) supports multiplication with other quaternions.</li>
    <li>The matrix type (<code>vmath.matrix4</code>) can be multiplied with numbers, other matrices and <code>vmath.vector4</code> values.</li>
    <li>All types performs equality comparison by each component value.</li>
    </ul>
**/
@:native("_G.vmath")
extern class Vmath {
    /**
        Calculates the conjugate of a quaternion.
        
        Calculates the conjugate of a quaternion. The result is a
        quaternion with the same magnitudes but with the sign of
        the imaginary (vector) parts changed:
        
        `q<super>*</super> = [w, -v]`
        
        @param q1 
        <span class="type">quatertion</span> quaternion of which to calculate the conjugate
        
        @return q 
        <span class="type">quatertion</span> the conjugate
    **/
    static function conj(q1:TODO<"quatertion">):TODO;

    /**
        Calculates the cross-product of two vectors.
        
        Given two linearly independent vectors P and Q, the cross product,
        P &#x00D7; Q, is a vector that is perpendicular to both P and Q and
        therefore normal to the plane containing them.
        
        If the two vectors have the same direction (or have the exact
        opposite direction from one another, i.e. are not linearly independent)
        or if either one has zero length, then their cross product is zero.
        
        @param v1 
        <span class="type">vector3</span> first vector
        
        @param v2 
        <span class="type">vector3</span> second vector
        
        @return v 
        <span class="type">vector3</span> a new vector representing the cross product
    **/
    static function cross(v1:Vector3, v2:Vector3):TODO;

    /**
        Calculates the dot-product of two vectors.
        
        The returned value is a scalar defined as:
        
        `P &#x22C5; Q = |P| |Q| cos &#x03B8;`
        
        where &#x03B8; is the angle between the vectors P and Q.
        
         * If the dot product is &gt;1.0 then the vectors are both pointing in the same direction.
         * If the dot product is zero the vectors are perpendicular (at right-angles to each other).
         * If the dot product is &lt; 1.0 then the vectors are pointing in opposite directions.
        
        @param v1 
        <span class="type">vector3 | vector4</span> first vector
        
        @param v2 
        <span class="type">vector3 | vector4</span> second vector
        
        @return n 
        <span class="type">number</span> dot product
    **/
    static function dot(v1:EitherType<Vector4, Vector3>, v2:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the inverse matrix..
        
        The resulting matrix is the inverse of the supplied matrix.
        
        <span class="icon-attention"></span> For ortho-normal matrices, e.g. regular object transformation,
        use `vmath.ortho_inv()` instead.
        The specialized inverse for ortho-normalized matrices is much faster
        than the general inverse.
        
        @param m1 
        <span class="type">matrix4</span> matrix to invert
        
        @return m 
        <span class="type">matrix4</span> inverse of the supplied matrix
    **/
    static function inv(m1:TODO<"matrix4">):TODO;

    /**
        Calculates the vector length.
        
        Returns the length of the supplied vector.
        
        @param v 
        <span class="type">vector3 | vector4</span> vector of which to calculate the length
        
        @return n 
        <span class="type">number</span> vector length
    **/
    static function length(v:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the squared vector length.
        
        Returns the squared length of the supplied vector.
        
        @param v 
        <span class="type">vector3 | vector4</span> vector of which to calculate the squared length
        
        @return n 
        <span class="type">number</span> squared vector length
    **/
    static function length_sqr(v:EitherType<Vector4, Vector3>):TODO;

    /**
        Lerps between two vectors.
        
        Linearly interpolate between two vectors. The function
        treats the vectors as positions and interpolates between
        the positions in a straight line. Lerp is useful to describe
        transitions from one place to another over time.
        
        <span class="icon-attention"></span> The function does not clamp t between 0 and 1.
        
        @param t 
        <span class="type">number</span> interpolation parameter, 0-1
        
        @param v1 
        <span class="type">vector3 | vector4</span> vector to lerp from
        
        @param v2 
        <span class="type">vector3 | vector4</span> vector to lerp to
        
        @return v 
        <span class="type">vector3 | vector4</span> the lerped vector
    **/
    static function lerp(t:Float, v1:EitherType<Vector4, Vector3>, v2:EitherType<Vector4, Vector3>):TODO;

    /**
        Lerps between two quaternions.
        
        Linearly interpolate between two quaternions. Linear
        interpolation of rotations are only useful for small
        rotations. For interpolations of arbitrary rotations,
        `vmath.slerp` yields much better results.
        
        <span class="icon-attention"></span> The function does not clamp t between 0 and 1.
        
        @param t 
        <span class="type">number</span> interpolation parameter, 0-1
        
        @param q1 
        <span class="type">quaternion</span> quaternion to lerp from
        
        @param q2 
        <span class="type">quaternion</span> quaternion to lerp to
        
        @return q 
        <span class="type">quaternion</span> the lerped quaternion
    **/
    static function lerp(t:Float, q1:TODO<"quaternion">, q2:TODO<"quaternion">):TODO;

    /**
        Lerps between two numbers.
        
        Linearly interpolate between two values. Lerp is useful
        to describe transitions from one value to another over time.
        
        <span class="icon-attention"></span> The function does not clamp t between 0 and 1.
        
        @param t 
        <span class="type">number</span> interpolation parameter, 0-1
        
        @param n1 
        <span class="type">number</span> number to lerp from
        
        @param n2 
        <span class="type">number</span> number to lerp to
        
        @return n 
        <span class="type">number</span> the lerped number
    **/
    static function lerp(t:Float, n1:Float, n2:Float):TODO;

    /**
        Creates a new identity matrix.
        
        The resulting identity matrix describes a transform with
        no translation or rotation.
        
        @return m 
        <span class="type">matrix4</span> identity matrix
    **/
    static function matrix4():TODO;

    /**
        Creates a new matrix from another existing matrix.
        
        Creates a new matrix with all components set to the
        corresponding values from the supplied matrix. I.e.
        the function creates a copy of the given matrix.
        
        @param m1 
        <span class="type">matrix4</span> existing matrix
        
        @return m 
        <span class="type">matrix4</span> matrix which is a copy of the specified matrix
    **/
    static function matrix4(m1:TODO<"matrix4">):TODO;

    /**
        Creates a matrix from an axis and an angle.
        
        The resulting matrix describes a rotation around the axis by the specified angle.
        
        @param v 
        <span class="type">vector3</span> axis
        
        @param angle 
        <span class="type">number</span> angle in radians
        
        @return m 
        <span class="type">matrix4</span> matrix represented by axis and angle
    **/
    static function matrix4_axis_angle(v:Vector3, angle:Float):TODO;

    /**
        Creates a matrix from a quaternion.
        
        The resulting matrix describes the same rotation as the quaternion, but does not have any translation (also like the quaternion).
        
        @param q 
        <span class="type">quaternion</span> quaternion to create matrix from
        
        @return m 
        <span class="type">matrix4</span> matrix represented by quaternion
    **/
    static function matrix4_from_quat(q:TODO<"quaternion">):TODO;

    /**
        Creates a frustum matrix.
        
        Constructs a frustum matrix from the given values. The left, right,
        top and bottom coordinates of the view cone are expressed as distances
        from the center of the near clipping plane. The near and far coordinates
        are expressed as distances from the tip of the view frustum cone.
        
        @param left 
        <span class="type">number</span> coordinate for left clipping plane
        
        @param right 
        <span class="type">number</span> coordinate for right clipping plane
        
        @param bottom 
        <span class="type">number</span> coordinate for bottom clipping plane
        
        @param top 
        <span class="type">number</span> coordinate for top clipping plane
        
        @param near 
        <span class="type">number</span> coordinate for near clipping plane
        
        @param far 
        <span class="type">number</span> coordinate for far clipping plane
        
        @return m 
        <span class="type">matrix4</span> matrix representing the frustum
    **/
    static function matrix4_frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):TODO;

    /**
        Creates a look-at view matrix.
        
        The resulting matrix is created from the supplied look-at parameters.
        This is useful for constructing a view matrix for a camera or
        rendering in general.
        
        @param eye 
        <span class="type">vector3</span> eye position
        
        @param look_at 
        <span class="type">vector3</span> look-at position
        
        @param up 
        <span class="type">vector3</span> up vector
        
        @return m 
        <span class="type">matrix4</span> look-at matrix
    **/
    static function matrix4_look_at(eye:Vector3, look_at:Vector3, up:Vector3):TODO;

    /**
        Creates an orthographic projection matrix.
        
        Creates an orthographic projection matrix.
        This is useful to construct a projection matrix for a camera or rendering in general.
        
        @param left 
        <span class="type">number</span> coordinate for left clipping plane
        
        @param right 
        <span class="type">number</span> coordinate for right clipping plane
        
        @param bottom 
        <span class="type">number</span> coordinate for bottom clipping plane
        
        @param top 
        <span class="type">number</span> coordinate for top clipping plane
        
        @param near 
        <span class="type">number</span> coordinate for near clipping plane
        
        @param far 
        <span class="type">number</span> coordinate for far clipping plane
        
        @return m 
        <span class="type">matrix4</span> orthographic projection matrix
    **/
    static function matrix4_orthographic(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):TODO;

    /**
        Creates a perspective projection matrix.
        
        Creates a perspective projection matrix.
        This is useful to construct a projection matrix for a camera or rendering in general.
        
        @param fov 
        <span class="type">number</span> angle of the full vertical field of view in radians
        
        @param aspect 
        <span class="type">number</span> aspect ratio
        
        @param near 
        <span class="type">number</span> coordinate for near clipping plane
        
        @param far 
        <span class="type">number</span> coordinate for far clipping plane
        
        @return m 
        <span class="type">matrix4</span> perspective projection matrix
    **/
    static function matrix4_perspective(fov:Float, aspect:Float, near:Float, far:Float):TODO;

    /**
        Creates a matrix from rotation around x-axis.
        
        The resulting matrix describes a rotation around the x-axis
        by the specified angle.
        
        @param angle 
        <span class="type">number</span> angle in radians around x-axis
        
        @return m 
        <span class="type">matrix4</span> matrix from rotation around x-axis
    **/
    static function matrix4_rotation_x(angle:Float):TODO;

    /**
        Creates a matrix from rotation around y-axis.
        
        The resulting matrix describes a rotation around the y-axis
        by the specified angle.
        
        @param angle 
        <span class="type">number</span> angle in radians around y-axis
        
        @return m 
        <span class="type">matrix4</span> matrix from rotation around y-axis
    **/
    static function matrix4_rotation_y(angle:Float):TODO;

    /**
        Creates a matrix from rotation around z-axis.
        
        The resulting matrix describes a rotation around the z-axis
        by the specified angle.
        
        @param angle 
        <span class="type">number</span> angle in radians around z-axis
        
        @return m 
        <span class="type">matrix4</span> matrix from rotation around z-axis
    **/
    static function matrix4_rotation_z(angle:Float):TODO;

    /**
        Normalizes a vector.
        
        Normalizes a vector, i.e. returns a new vector with the same
        direction as the input vector, but with length 1.
        
        <span class="icon-attention"></span> The length of the vector must be above 0, otherwise a
        division-by-zero will occur.
        
        @param v1 
        <span class="type">vector3 | vector4</span> vector to normalize
        
        @return v 
        <span class="type">vector3 | vector4</span> new normalized vector
    **/
    static function normalize(v1:EitherType<Vector4, Vector3>):TODO;

    /**
        Calculates the inverse of an ortho-normal matrix..
        
        The resulting matrix is the inverse of the supplied matrix.
        The supplied matrix has to be an ortho-normal matrix, e.g.
        describe a regular object transformation.
        
        <span class="icon-attention"></span> For matrices that are not ortho-normal
        use the general inverse `vmath.inv()` instead.
        
        @param m1 
        <span class="type">matrix4</span> ortho-normalized matrix to invert
        
        @return m 
        <span class="type">matrix4</span> inverse of the supplied matrix
    **/
    static function ortho_inv(m1:TODO<"matrix4">):TODO;

    /**
        Projects a vector onto another vector.
        
        Calculates the extent the projection of the first vector onto the second.
        The returned value is a scalar p defined as:
        
        `p = |P| cos &#x03B8; / |Q|`
        
        where &#x03B8; is the angle between the vectors P and Q.
        
        @param v1 
        <span class="type">vector3</span> vector to be projected on the second
        
        @param v2 
        <span class="type">vector3</span> vector onto which the first will be projected, must not have zero length
        
        @return n 
        <span class="type">number</span> the projected extent of the first vector onto the second
    **/
    static function project(v1:Vector3, v2:Vector3):TODO;

    /**
        Creates a new identity quaternion.
        
        Creates a new identity quaternion. The identity
        quaternion is equal to:
        
        `vmath.quat(0, 0, 0, 1)`
        
        @return q 
        <span class="type">quaternion</span> new identity quaternion
    **/
    static function quat():TODO;

    /**
        Creates a new quaternion from another existing quaternion.
        
        Creates a new quaternion with all components set to the
        corresponding values from the supplied quaternion. I.e.
        This function creates a copy of the given quaternion.
        
        @param q1 
        <span class="type">quaternion</span> existing quaternion
        
        @return q 
        <span class="type">quaternion</span> new quaternion
    **/
    static function quat(q1:TODO<"quaternion">):TODO;

    /**
        Creates a new quaternion from its coordinates.
        
        Creates a new quaternion with the components set
        according to the supplied parameter values.
        
        @param x 
        <span class="type">number</span> x coordinate
        
        @param y 
        <span class="type">number</span> y coordinate
        
        @param z 
        <span class="type">number</span> z coordinate
        
        @param w 
        <span class="type">number</span> w coordinate
        
        @return q 
        <span class="type">quaternion</span> new quaternion
    **/
    static function quat(x:Float, y:Float, z:Float, w:Float):TODO;

    /**
        Creates a quaternion to rotate around a unit vector.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the axis described by the unit vector `v`.
        
        @param v 
        <span class="type">vector3</span> axis
        
        @param angle 
        <span class="type">number</span> angle
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the axis-angle rotation
    **/
    static function quat_axis_angle(v:Vector3, angle:Float):TODO;

    /**
        Creates a quaternion from three base unit vectors.
        
        The resulting quaternion describes the rotation from the
        identity quaternion (no rotation) to the coordinate system
        as described by the given x, y and z base unit vectors.
        
        @param x 
        <span class="type">vector3</span> x base vector
        
        @param y 
        <span class="type">vector3</span> y base vector
        
        @param z 
        <span class="type">vector3</span> z base vector
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the rotation of the specified base vectors
    **/
    static function quat_basis(x:Vector3, y:Vector3, z:Vector3):TODO;

    /**
        Creates a quaternion to rotate between two unit vectors.
        
        The resulting quaternion describes the rotation that,
        if applied to the first vector, would rotate the first
        vector to the second. The two vectors must be unit
        vectors (of length 1).
        
        <span class="icon-attention"></span> The result is undefined if the two vectors point in opposite directions
        
        @param v1 
        <span class="type">vector3</span> first unit vector, before rotation
        
        @param v2 
        <span class="type">vector3</span> second unit vector, after rotation
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the rotation from first to second vector
    **/
    static function quat_from_to(v1:Vector3, v2:Vector3):TODO;

    /**
        Creates a quaternion from rotation around x-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the x-axis.
        
        @param angle 
        <span class="type">number</span> angle in radians around x-axis
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the rotation around the x-axis
    **/
    static function quat_rotation_x(angle:Float):TODO;

    /**
        Creates a quaternion from rotation around y-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the y-axis.
        
        @param angle 
        <span class="type">number</span> angle in radians around y-axis
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the rotation around the y-axis
    **/
    static function quat_rotation_y(angle:Float):TODO;

    /**
        Creates a quaternion from rotation around z-axis.
        
        The resulting quaternion describes a rotation of `angle`
        radians around the z-axis.
        
        @param angle 
        <span class="type">number</span> angle in radians around z-axis
        
        @return q 
        <span class="type">quaternion</span> quaternion representing the rotation around the z-axis
    **/
    static function quat_rotation_z(angle:Float):TODO;

    /**
        Rotates a vector by a quaternion.
        
        Returns a new vector from the supplied vector that is
        rotated by the rotation described by the supplied
        quaternion.
        
        @param q 
        <span class="type">quatertion</span> quaternion
        
        @param v1 
        <span class="type">vector3</span> vector to rotate
        
        @return v 
        <span class="type">vector3</span> the rotated vector
    **/
    static function rotate(q:TODO<"quatertion">, v1:Vector3):TODO;

    /**
        Slerps between two vectors.
        
        Spherically interpolates between two vectors. The difference to
        lerp is that slerp treats the vectors as directions instead of
        positions in space.
        
        The direction of the returned vector is interpolated by the angle
        and the magnitude is interpolated between the magnitudes of the
        from and to vectors.
        
        <span class="icon-attention"></span> Slerp is computationally more expensive than lerp.
        The function does not clamp t between 0 and 1.
        
        @param t 
        <span class="type">number</span> interpolation parameter, 0-1
        
        @param v1 
        <span class="type">vector3 | vector4</span> vector to slerp from
        
        @param v2 
        <span class="type">vector3 | vector4</span> vector to slerp to
        
        @return v 
        <span class="type">vector3 | vector4</span> the slerped vector
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
        
        <span class="icon-attention"></span> The function does not clamp t between 0 and 1.
        
        @param t 
        <span class="type">number</span> interpolation parameter, 0-1
        
        @param q1 
        <span class="type">quaternion</span> quaternion to slerp from
        
        @param q2 
        <span class="type">quaternion</span> quaternion to slerp to
        
        @return q 
        <span class="type">quaternion</span> the slerped quaternion
    **/
    static function slerp(t:Float, q1:TODO<"quaternion">, q2:TODO<"quaternion">):TODO;

    /**
        Create a new vector from a table of values.
        
        Creates a vector of arbitrary size. The vector is initialized
        with numeric values from a table.
        
        <span class="icon-attention"></span> The table values are converted to floating point
        values. If a value cannot be converted, a 0 is stored in that
        value position in the vector.
        
        @param t 
        <span class="type">table</span> table of numbers
        
        @return v 
        <span class="type">vector</span> new vector
    **/
    static function vector(t:TODO<"table">):TODO;

    /**
        Creates a new zero vector.
        
        Creates a new zero vector with all components set to 0.
        
        @return v 
        <span class="type">vector3</span> new zero vector
    **/
    static function vector3():TODO;

    /**
        Creates a new vector from scalar value.
        
        Creates a new vector with all components set to the
        supplied scalar value.
        
        @param n 
        <span class="type">number</span> scalar value to splat
        
        @return v 
        <span class="type">vector3</span> new vector
    **/
    static function vector3(n:Float):TODO;

    /**
        Creates a new vector from another existing vector.
        
        Creates a new vector with all components set to the
        corresponding values from the supplied vector. I.e.
        This function creates a copy of the given vector.
        
        @param v1 
        <span class="type">vector3</span> existing vector
        
        @return v 
        <span class="type">vector3</span> new vector
    **/
    static function vector3(v1:Vector3):TODO;

    /**
        Creates a new vector from its coordinates.
        
        Creates a new vector with the components set to the
        supplied values.
        
        @param x 
        <span class="type">number</span> x coordinate
        
        @param y 
        <span class="type">number</span> y coordinate
        
        @param z 
        <span class="type">number</span> z coordinate
        
        @return v 
        <span class="type">vector3</span> new vector
    **/
    static function vector3(x:Float, y:Float, z:Float):TODO;

    /**
        Creates a new zero vector.
        
        Creates a new zero vector with all components set to 0.
        
        @return v 
        <span class="type">vector4</span> new zero vector
    **/
    static function vector4():TODO;

    /**
        Creates a new vector from scalar value.
        
        Creates a new vector with all components set to the
        supplied scalar value.
        
        @param n 
        <span class="type">number</span> scalar value to splat
        
        @return v 
        <span class="type">vector4</span> new vector
    **/
    static function vector4(n:Float):TODO;

    /**
        Creates a new vector from another existing vector.
        
        Creates a new vector with all components set to the
        corresponding values from the supplied vector. I.e.
        This function creates a copy of the given vector.
        
        @param v1 
        <span class="type">vector4</span> existing vector
        
        @return v 
        <span class="type">vector4</span> new vector
    **/
    static function vector4(v1:Vector4):TODO;

    /**
        Creates a new vector from its coordinates.
        
        Creates a new vector with the components set to the
        supplied values.
        
        @param x 
        <span class="type">number</span> x coordinate
        
        @param y 
        <span class="type">number</span> y coordinate
        
        @param z 
        <span class="type">number</span> z coordinate
        
        @param w 
        <span class="type">number</span> w coordinate
        
        @return v 
        <span class="type">vector4</span> new vector
    **/
    static function vector4(x:Float, y:Float, z:Float, w:Float):TODO;
}